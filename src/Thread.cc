#include <stdio.h>
#include <semaphore.h>

#include "Thread.h"
#include "CurrentThread.h"

std::atomic_int Thread::_numCreated_(0); // 记录创建线程的数量

Thread::Thread(ThreadFunc cb, std::string tname)
    : _start_(false),
      _join_(false),
      _tid_(0),
      _tname_(tname),
      _func_(std::move(cb))
{
    setDefaultName();
}

Thread::~Thread()
{
    if (_start_ && !_join_)
    {
        _thread_->detach();
    }
}

void Thread::start()
{
    _start_ = true;
    sem_t sem;
    sem_init(&sem, false, 0);

    // 开启线程
    _thread_ = std::shared_ptr<std::thread>(new std::thread([&]()
                                                            {
        // 获取线程的tid值
        _tid_ = CurrentThread::tid();
        sem_post(&sem);
        // 开启一个新线程，专门执行该线程函数
        _func_(); }));
    sem_wait(&sem);
}

void Thread::join()
{
    _join_ = true;
    _thread_->join();
}

void Thread::setDefaultName() // 设置线程默认名字
{
    int num = ++_numCreated_;
    if (_tname_.empty())
    {
        char buffer[32];
        snprintf(buffer, sizeof(buffer) - 1, "Thread%d", num);
        _tname_ = buffer;
    }
}
