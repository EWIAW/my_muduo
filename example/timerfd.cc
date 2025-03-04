// 自己实现一个定时器
#include <functional>
#include <vector>
#include <memory>
#include <unordered_map>
#include <iostream>
#include <unistd.h>

// 一个定时任务类
using TaskFunc = std::function<void()>;    // 时间到后，所需要执行的任务函数
using ReleaseFunc = std::function<void()>; // 任务销毁后，所需要执行的释放资源函数
class TimerTask
{
private:
    uint64_t _id;         // 任务id
    uint32_t _delay_time; // 任务定时时间
    bool _is_canceled;    // 判断任务是否还要执行  false--未被取消，true--已被取消

    TaskFunc _timerTask;      // 时间到后，所需要执行的任务函数
    ReleaseFunc _releaseFunc; // 任务销毁后，所需要执行的释放资源函数
public:
    TimerTask(uint64_t id, uint32_t delay_time, const TaskFunc &TimerTask)
        : _id(id),
          _delay_time(delay_time),
          _timerTask(TimerTask),
          _is_canceled(false)
    {
    }

    ~TimerTask()
    {
        if (_is_canceled == false)
        {
            _timerTask();
        }
        _releaseFunc();
    }

    void Set_Ontimer_Func(const ReleaseFunc &cb)
    {
        _timerTask = cb;
    }

    void Set_Release_Func(const ReleaseFunc &cb)
    {
        _releaseFunc = cb;
    }

    void Cancel()
    {
        _is_canceled = true;
    }

    uint32_t Get_Delay_Time()
    {
        return _delay_time;
    }
};

// 时间轮类
#define CAPACITY 60
class TimerWheel
{
    using Shared_Ptr_Task = std::shared_ptr<TimerTask>;
    using Weak_Ptr_Task = std::weak_ptr<TimerTask>;

private:
    int _capacity;                                        //_wheel时间轮的大小
    int _tick;                                            // 当前秒针走到哪
    std::vector<std::vector<Shared_Ptr_Task>> _wheel;     // 时间轮
    std::unordered_map<u_int64_t, Weak_Ptr_Task> _timers; // 存储着每个定时任务的弱指针
public:
    TimerWheel()
        : _capacity(CAPACITY),
          _tick(0),
          _wheel(_capacity)
    {
    }

    ~TimerWheel()
    {
    }

    // 判断一个定时任务在不在_timers里面
    bool Is_In_Timers(const uint64_t &id)
    {
        std::unordered_map<u_int64_t, Weak_Ptr_Task>::iterator it = _timers.find(id);
        if (it != _timers.end())
            return true;
        else
            return false;
    }

    // 添加任务
    void Task_Add(const uint64_t &id, const uint32_t &delay, const TaskFunc &cb)
    {
        if (delay > _capacity || delay < 0) // 不合法的延时时间
            return;
        // 构造一个定时任务
        Shared_Ptr_Task task(new TimerTask(id, delay, cb));
        task->Set_Release_Func(std::bind(&TimerWheel::Remove_Timers, this, id));
        _timers[id] = Weak_Ptr_Task(task);
        _wheel[(_tick + delay) % _capacity].push_back(task);
    }

    // 刷新任务
    void Task_Refresh(const uint64_t &id)
    {
        std::unordered_map<uint64_t, Weak_Ptr_Task>::iterator it = _timers.find(id);
        if (it != _timers.end())
        {
            int delay = it->second.lock()->Get_Delay_Time();
            _wheel[(_tick + delay) % _capacity].push_back(std::shared_ptr<TimerTask>(it->second.lock()));
        }
    }

    void Remove_Timers(const uint64_t &id)
    {
        if (Is_In_Timers(id) == true)
        {
            _timers.erase(id);
        }
    }

    // 时间轮往后走一步
    void Wheel_Run()
    {
        _tick = (_tick + 1) % _capacity;
        _wheel[_tick].clear();
    }
};

class TimerTest
{
public:
    TimerTest()
    {
        std::cout << "构造函数" << std::endl;
    }
    ~TimerTest()
    {
        std::cout << "析构函数" << std::endl;
    }
};

void Delete(TimerTest *t)
{
    delete t;
}

int main()
{
    TimerWheel tw;
    TimerTest *task = new TimerTest;

    tw.Task_Add(3, 5, std::bind(Delete, task));

    for (int i = 0; i < 5; i++)
    {
        sleep(1);
        tw.Task_Refresh(3);
        std::cout<<"刷新了一下任务"<<std::endl;
        tw.Wheel_Run();
    }

    while(1)
    {
        sleep(1);
        std::cout<<"-----"<<std::endl;
        tw.Wheel_Run();
    }

    return 0;
}