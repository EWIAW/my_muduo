#include <sys/eventfd.h>

#include <string.h>

#include "EventLoop.h"
#include "Channel.h"
#include "Logger.h"

// 防止一个线程创建多个eventloop thread_local
__thread EventLoop *t_loopInThisThread = nullptr;

// 定义epoll_wait所设置的超时时间
const int kPollTimeMs = 10000;

// 创建wakeupfd，用来唤醒subloop来处理新的channel
int createEventFd()
{
    int evtfd = eventfd(0, EFD_NONBLOCK | EFD_CLOEXEC);
    if (evtfd < 0)
    {
        LOG_DEBUG("create eventfd failed , errno : %d , reason : %s", errno, strerror(errno));
    }
    return evtfd;
}

EventLoop::EventLoop()
    : _looping_(false),
      _quit_(false),
      _threadId_(CurrentThread::tid()),
      // _pollReturnTIme_(0),
      _poller_(Poller::newDefaultPoller(this)),
      _wakeupFd_(createEventFd()),
      _wakeupChannel_(new Channel(this, _wakeupFd_)),
      _callingPendingFunctors_(false)
{
    LOG_DEBUG("EventLoop create %p in thread %d", this, _threadId_);
    if (t_loopInThisThread != nullptr)
    {
        LOG_FATAL("Another EventLoop %d exists in this thread %d", t_loopInThisThread, _threadId_);
    }
    else
    {
        t_loopInThisThread = this;
    }
    _wakeupChannel_->SetReadCallback(std::bind(&EventLoop::handlerRead, this));
    _wakeupChannel_->EnableReading();
}

EventLoop::~EventLoop()
{
    _wakeupChannel_->DisableAll();
    _wakeupChannel_->remove();
    close(_wakeupFd_);
    t_loopInThisThread = nullptr;
}

void EventLoop::loop() // 开启事件循环
{
    _looping_ = true;
    _quit_ = false;
    LOG_INFO("EventLoop %p start looping", this);
    while (!_quit_)
    {
        _activeChannels_.clear();
        _pollReturnTIme_ = _poller_->poll(kPollTimeMs, &_activeChannels_);
        for (Channel *channel : _activeChannels_)
        {
            channel->HandlerEvent(_pollReturnTIme_);
        }
        doPendingFunctor();
    }
    LOG_INFO("EventLoop %p stop looping", this);
    _looping_ = true;
}

void EventLoop::quit() // 退出事件循环
{
    _quit_ = false;
    if (!isInLoopThread())
    {
        wakeup();
    }
}

// 在当前loop中执行回调
void EventLoop::runInLoop(Functor cb)
{
    if (isInLoopThread())
    {
        cb();
    }
    else
    {
        queueInLoop(cb);
    }
}

// 把cb放入队列中，唤醒loop所在线程，执行cb
void EventLoop::queueInLoop(Functor cb)
{
    {
        std::unique_lock<std::mutex> lock(_mutex_);
        _pendingFunctors_.emplace_back(cb);
    }

    if (!isInLoopThread() || _callingPendingFunctors_)
    {
        wakeup();
    }
}

void EventLoop::handlerRead() // wake up
{
    uint64_t one = 1;
    ssize_t n = read(_wakeupFd_, &one, sizeof(one));
    if (n != sizeof(one))
    {
        LOG_ERROR("read the _wakeupFd_ error");
    }
}

void EventLoop::wakeup()
{
    uint64_t one = 1;
    ssize_t n = write(_wakeupFd_, &one, sizeof(one));
    if (n != sizeof(one))
    {
        LOG_ERROR("write the _wakeupFd_ error");
    }
}

void EventLoop::updateChannel(Channel *channel)
{
    _poller_->updateChannel(channel);
}

void EventLoop::removeChannel(Channel *channel)
{
    _poller_->removeChannel(channel);
}

bool EventLoop::hasChannel(Channel *channel)
{
    return _poller_->hasPoller(channel);
}

// 这个函数需要加锁，那是因为
void EventLoop::doPendingFunctor() // 执行回调
{
    std::vector<Functor> functors;
    _callingPendingFunctors_ = true;

    {
        std::unique_lock<std::mutex> lock(_mutex_);
        _pendingFunctors_.swap(functors);
    }

    for (const Functor &cb : functors)
    {
        cb();
    }
    _callingPendingFunctors_ = false;
}
