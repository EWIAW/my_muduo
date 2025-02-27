#include <iostream>
#include <list>
#include <vector>
#include <unordered_set>
#include <functional>
#include <memory>
#include <unordered_map>
#include <cassert>
#include <unistd.h>
/*定时任务类*/

using OnTimerCallback = std::function<void()>;
using ReleaseCallback = std::function<void()>;

// 一个Timer对象 代表 一个定时任务
class Timer
{
private:
    int _timeout;       /*当前定时器任务的延迟时间*/
    bool _canceled;     /*false-任务正常执⾏； true-任务被取消*/
    uint64_t _timer_id; /*定时器ID*/
    OnTimerCallback _timer_callback;
    /*实际释任务类对象实际析构时要执⾏的操作，主要⽤于移除TimerQueue中保存的weak_ptr<Timer>信息*/
    ReleaseCallback _release_callback;

public:
    Timer(uint64_t timer_id, int timeout) : _timer_id(timer_id),
                                            _timeout(timeout), _canceled(false) {}
    ~Timer()
    {
        /*先从timerqueue保存的weak_ptr<timer>数组中，将weak_ptr移除，避免下边的
       定时任务回调中有对定时器任务的操作*/
        /*⽐如在_timer_callback中调⽤ canceled，取消的时候是可以找到定时器任务
       的，因为判断定时器任务是否存在的依据是timerqueue中是否有信息*/
        /*⽽能⾛到析构，证明shared_ptr计数为0了， 这时候timequeue中的weak_ptr获取
       到的shared_ptr就是空了，需要谨慎操作*/
        if (_release_callback)
            _release_callback();
        if (_timer_callback && !_canceled)
            _timer_callback(); /*定时器被取消，则析构的时候不再执⾏任务*/
    }
    uint64_t id();
    int delay_time() { return _timeout; } /*获取定时器任务的初始延迟时间*/
    void canceled() { _canceled = true; } /*取消定时器任务*/

    void set_on_time_callback(const OnTimerCallback &cb)
    {
        _timer_callback = cb;
    }

    void set_release_callback(const ReleaseCallback &cb)
    {
        _release_callback = cb;
    }
};

// TimerQueue用来管理Timer对象（定时任务）
#define MAX_TIMEOUT 60
class TimerQueue
{
private:
    using WeakTimer = std::weak_ptr<Timer>;
    using PtrTimer = std::shared_ptr<Timer>;

    /*时间轮每个节点都是⼀个vector，这样同⼀个时刻可以添加多个定时器任务*/
    using Bucket = std::vector<PtrTimer>;

    /*为了提⾼通过下标随机访问的效率，这⾥使⽤了数组实现单层时间轮*/
    using BucketList = std::vector<Bucket>;

    /*滴答秒针，每次执⾏⼀次定时器时间到，就会向后⾛⼀步，⾛到哪⾥就清空BucketList的哪个数组*/
    int _tick;

    /*时间轮的容量，这个容量其实就是最⼤的定时时⻓*/
    /*如果想要设计更⼤时间的定时器，可以再设计⼀个具有60个节点的分针定时器，它是60s滴答⼀次，定时任务就是到期了将实际任务加⼊到秒针轮中*/

    int _capacity;
    /*实现单层时间轮的数组，每秒钟tick向后⾛⼀步，⾛到哪⾥，就将哪⾥的vector进⾏clear，则其内的定时器PtrTimer将全部被释放*/
    /*若PtrTimer的shared_ptr计数器位0，将将会真正被释放，执⾏Timer的析构函数，完成定时任务的执⾏*/
    BucketList _conns;
    /*保存所有定时任务对象的weak_ptr，这样才能在不影响shared_ptr计数器的同时，获取shared_ptr*/
    std::unordered_map<uint64_t, WeakTimer> _timers;

public:
    TimerQueue() : _tick(0),
                   _capacity(MAX_TIMEOUT),
                   _conns(_capacity) {}

    /*判断定时任务是否存在， 注意：这个接⼝是⼀个⾮线程安全接⼝，只能内部使⽤，不能外部其他线程调⽤，⽬前只在enable_inactive_release_in_loop中使⽤了*/
    bool has_timer(uint64_t id)
    {
        auto it = _timers.find(id);
        if (it != _timers.end())
        {
            return true;
        }
        return false;
    }

    /*添加⼀个定时任务*/
    void timer_add(const OnTimerCallback &cb, int delay, uint64_t id)
    {
        /*60s以上和0s以下的定时任务不⽀持....*/
        if (delay > _capacity || delay <= 0)
            return;

        /*new⼀个定时任务对象出来*/
        PtrTimer timer(new Timer(id, delay));

        /*设置定时任务对象要执⾏的定时任务--会在对象被析构时执⾏*/
        timer->set_on_time_callback(cb);

        /*因为当前类成员_timers中保存了⼀份定时任务对象的weak_ptr，因此希望在析构的同时进⾏移除*/
        timer->set_release_callback(std::bind(&TimerQueue::remove_weaktimer_from_timerqueue, this, id));

        /*根据定时任务对象的shared_ptr获取其weak_ptr保存起来，以便于⼆次刷新任务，也就是任务需要延迟执⾏的时候，重新继续添加⼀个定时任务进去，可以使⽤相同的shared_ptr计数*/
        _timers[id] = WeakTimer(timer);

        /*tick是当前的指针位置*/
        _conns[(_tick + delay) % _capacity].push_back(timer);
    }

    /*根据id刷新定时任务*/
    void timer_refresh(uint64_t id)
    {
        auto it = _timers.find(id);

        /*不可能存在这种情况呀, 添加的定时任务找不着，其实也不能因为⼀个定时任务找不到⽽让程序退出，return其实就⾏，这⾥主要是调试⽤断⾔*/
        assert(it != _timers.end());

        int delay = it->second.lock()->delay_time();
        _conns[(_tick + delay) % _capacity].push_back(PtrTimer(it->second));
    }

    void timer_cancel(uint64_t id)
    {
        auto it = _timers.find(id);
        assert(it != _timers.end());
        PtrTimer pt = it->second.lock();
        if (pt)
            pt->canceled();
    }

    /*设置给Timer，最终定时任务执⾏完毕后从timequeue移除timer信息的回调函数*/
    void remove_weaktimer_from_timerqueue(uint64_t id)
    {
        auto it = _timers.find(id);
        if (it != _timers.end())
        {
            _timers.erase(it);
        }
    }

    void run_ontime_task()
    {
        /*每滴答⼀次被执⾏_tick++就会向后⾛⼀步，⾛到哪⾥，释放哪⾥的定时器，也就是执⾏哪⾥的定时任务*/
        _tick = (_tick + 1) % _capacity;
        _conns[_tick].clear();
    }
};

class TimerTest
{
private:
    int _data;

public:
    TimerTest(int data) : _data(data) { std::cout << "test 构造!\n"; }
    ~TimerTest() { std::cout << "test 析构!\n"; }
};

void del(TimerTest *t)
{
    delete t;
}

int main()
{
    /*创建⼀个固定5s的定时任务队列， 每个添加的任务将在被添加5s后执⾏*/
    TimerQueue tq;
    /*new 了⼀个对象*/
    TimerTest *t = new TimerTest(10);
    /*随便设置了⼀个定时器ID*/
    int id = 3;
    /*std::bind(del, t) 构建适配了⼀个释放函数，作为定时任务执⾏函数*/
    /*这⾥其实就是添加了⼀个5秒后执⾏的定时任务，任务是销毁t指针指向的空间*/
    tq.timer_add(std::bind(del, t), 5, id);
    /*按理说这个任务5s后就会被执⾏，析构，但是因为循环内总是在刷新任务，也就是⼆次添加任务，因此，它的计数总是>0，不会被释放，之后最后⼀个任务对象shared_ptr被释放才会真正析构*/
    for (int i = 0; i < 5; i++)
    {
        sleep(1);
        tq.timer_refresh(id);
        std::cout << "刷新了⼀下3号定时任务!\n";
        tq.run_ontime_task(); // 每秒调⽤⼀次，模拟定时器
    }
    std::cout << "刷新定时任务停⽌, 5s后释放任务将被执⾏\n";
    while (1)
    {
        std::cout << "--------------------\n";
        sleep(1);
        tq.run_ontime_task(); // 每秒调⽤⼀次，模拟定时器
        if (tq.has_timer(id) == false)
        {
            std::cout << "定时任务已经被执⾏完毕！\n";
            break;
        }
    }
    return 0;
}
