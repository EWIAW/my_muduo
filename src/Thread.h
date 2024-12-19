#pragma once

#include <thread>
#include <string>
#include <memory>
#include <functional>
#include <atomic>

class Thread
{
    using ThreadFunc = std::function<void()>;

public:
    explicit Thread(ThreadFunc cb, std::string tname = std::string());
    ~Thread();

    void start();
    void join();

    bool started() { return _start_; }
    pid_t tid() { return _tid_; }
    const std::string &name() { return _tname_; }

    static int numCreated() { return _numCreated_; }

private:
    void setDefaultName(); // 设置线程默认名字

private:
    bool _start_;
    bool _join_;

    std::shared_ptr<std::thread> _thread_;
    pid_t _tid_;
    std::string _tname_;
    ThreadFunc _func_;
    static std::atomic_int _numCreated_; // 记录创建线程的数量
};