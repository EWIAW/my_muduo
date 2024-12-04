#pragma once

#include <unistd.h>

#include <atomic>
#include <memory>
#include <vector>
#include <mutex>
#include <functional>

#include "Timestamp.h"
#include "Poller.h"
#include "CurrentThread.h"
#include "noncopyable.h"

class Channel;
class Poller;

class Eventloop : noncopyable
{
    using Functor = std::function<void()>;

public:
    Eventloop();
    ~Eventloop();

    void loop(); // 开启事件循环
    void quit(); // 退出事件循环

    // 返回poll返回的时间戳
    Timestamp pollReturnTime() { return _pollReturnTIme_; }

    // 在当前loop中执行回调
    void runInLoop(Functor cb);
    // 把cb放入队列中，唤醒loop所在线程，执行cb
    void queueInLoop(Functor cb);

    // 唤醒loop所在线程
    void wakeup();

    // Channel需要update，需要去调用poller的方法，但是这两个是两个独立的类，之间不能直接访问访问对方的成员函数，所有需要借助eventloop来访问
    void updateChannel(Channel *channel);
    void removeChannel(Channel *channel);
    void hasChannel(Channel *channel);

    // 判断当前EventLoop是否在自己的线程中
    bool isInLoopThread() { return _threadId_ == CurrentThread::tid(); }

private:
    void handlerRead();      // wake up
    void doPendingFunctor(); // 执行回调

    using ChannelLists = std::vector<Channel *>;

    std::atomic_bool _looping_; // 标识eventloop正在循环
    std::atomic_bool _quit_;    // 标识退出loop循环
    const pid_t _threadId_;     // 标识这个loop属于那个线程

    Timestamp _pollReturnTIme_; // 记录poll函数返回的时间戳
    std::unique_ptr<Poller> _poller_;

    // 当mainloop获取一个新用户的channel时，通过轮询算法选择一个subloop，通过该成员变量唤醒subloop处理channel
    int _wakeupFd_;
    std::unique_ptr<Channel> _wakeupChannel_;

    ChannelLists _activeChannels_;

    std::atomic_bool _callingPendingFunctors_; // 判断当前loop是否有需要/正在执行的回调
    std::vector<Functor> _pendingFunctors_;    // 存储loop所有需要执行的回调
    std::mutex _mutex_;
};