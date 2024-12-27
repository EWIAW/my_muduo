#pragma once

#include <string>
#include <vector>
#include <memory>
#include <functional>

#include "noncopyable.h"
#include "EventLoopThread.h"

class EventLoop;
class EventLoopThread;

class EventLoopThreadPool : noncopyable
{
    using ThreadInitCallback = std::function<void(EventLoop *)>;

public:
    EventLoopThreadPool(EventLoop *baseloop, const std::string &nameArg);
    ~EventLoopThreadPool();

    void setThreadNum(int numThreads) { _numsThread_ = numThreads; }
    void start(const ThreadInitCallback &cb = ThreadInitCallback());

    // 如果是多线程运行，则使用轮询的方式分配channel给subloop
    EventLoop *getNextLoop();

    std::vector<EventLoop *> getAllLoop();

    bool started() { return _started_; }
    const std::string name() { return _name_; }

private:
    EventLoop *_baseLoop_;
    std::string _name_;
    bool _started_;
    int _numsThread_;
    int _next_;
    std::vector<std::unique_ptr<EventLoopThread>> _threads_;
    std::vector<EventLoop *> _loops_;
};