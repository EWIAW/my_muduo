#include <sys/epoll.h>

#include "Channel.h"
#include "EventLoop.h"

// 保存事件可读可写的状态
const int Channel::kNoneEvent = 0;
const int Channel::kReadEvent = EPOLLIN | EPOLLPRI; // EPOLLPRI代表有紧急数据要监听
const int Channel::kWriteEvent = EPOLLOUT;

Channel::Channel(EventLoop *loop, int fd)
    : _loop_(loop),
      _fd_(fd),
      _events_(0),
      _revents_(0),
      _index_(-1), //-1代表该channel未添加到poller中
      _tied_(false)
{
}

Channel::~Channel()
{
}

void Channel::tie(const std::shared_ptr<void> &obj) // ？？？
{
    _tie_ = obj;
    _tied_ = true;
}

// channel的更新需要调用epoll_ctl，但是epoll_ctl是封装在Poller当中的，所以不能直接去嗲用
// 而Poller有封装在EventLoop中，所以需要去调用EventLoop的update
void Channel::update()
{
    _loop_->updateChannel(this);
}

// 将channel从epoll模型中删除
void Channel::remove()
{
    _loop_->removeChannel(this);
}

// channel得到poller通知后，处理事件
void Channel::HandlerEvent(Timestamp receiveTime) // ？？？
{
    if (_tied_)
    {
        std::shared_ptr<void> guard = _tie_.lock();
        if (guard)
        {
            HandlerEventWithGuard(receiveTime);
        }
    }
    else
    {
        HandlerEventWithGuard(receiveTime);
    }
}

void Channel::HandlerEventWithGuard(Timestamp receiveTime)
{
    if ((_revents_ & EPOLLHUP) && !(_revents_ & EPOLLIN)) // EPOLLHUP说明对端关闭连接
    {                                                     // !(_revents_ & EPOLLIN)说明对端无残留数据，可以直接关闭连接
        if (_CloseCallback_)
            _CloseCallback_();
    }

    if (_revents_ & EPOLLERR)
    {
        if (_ErrorCallback_)
            _ErrorCallback_();
    }

    if (_revents_ & (EPOLLIN | EPOLLPRI))
    {
        if (_ReadCallback_)
            _ReadCallback_(receiveTime);
    }

    if (_revents_ & EPOLLOUT)
    {
        if (_WriteCallback_)
            _WriteCallback_();
    }

    // 发生任意事件后，都要执行的回调，这里其实是去调用定时器的功能，即刷新定时任务
    if (_EventCallback_)
    {
        _EventCallback_();
    }
}
