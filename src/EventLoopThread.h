#pragma once
#include <mutex>
#include <condition_variable>
#include <functional>
#include <string>

#include "Thread.h"

class EventLoop;

class EventLoopThread
{
    using ThreadInitCallback = std::function<void(EventLoop *)>;

public:
    EventLoopThread(const ThreadInitCallback &cb = ThreadInitCallback(), const std::string &name = std::string());
    ~EventLoopThread();

    EventLoop *startLoop();

private:
    void threadFunc();

    EventLoop *_loop_;
    bool _exiting_;
    Thread _thread_;
    std::mutex _mutex_;
    std::condition_variable _cond_;
    ThreadInitCallback _callback_;
};