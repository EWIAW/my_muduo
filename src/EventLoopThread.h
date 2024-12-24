#pragma once
#include <mutex>
#include <condition_variable>
#include <functional>
#include <string>

#include "Thread.h"
#include "noncopyable.h"

class EventLoop;

class EventLoopThread : noncopyable
{
    using ThreadInitCallback = std::function<void(EventLoop *)>;

public:
    EventLoopThread(const ThreadInitCallback &cb = ThreadInitCallback(), const std::string &name = std::string());
    ~EventLoopThread();

    EventLoop *startLoop();

private:
    // 创建线程时，线程需要运行的函数
    void threadFunc();

private:
    EventLoop *_loop_;
    bool _exiting_;
    Thread _thread_;
    std::mutex _mutex_;
    std::condition_variable _cond_;
    ThreadInitCallback _callback_;
};