#include <sys/epoll.h>

#include "Channel.h"

// 保存事件可读可写的状态
const int Channel::kNoneEvent = 0;
const int Channel::kReadEvent = EPOLLIN | EPOLLPRI;
const int Channel::kWriteEvent = EPOLLOUT;

Channel::Channel(Eventloop *loop, int fd)
    : _loop_(loop),
      _fd_(fd),
      _events_(0),
      _revents_(0),
      _index_(-1),
      _tied_(false)
{
}

Channel::~Channel()
{
}

void Channel::tie(const std::shared_ptr<void> &obj)
{
    _tie_ = obj;
    _tied_ = true;
}

void Channel::update()
{
    // todo
}

void Channel::remove()
{
    // todo
}

void Channel::HandlerEvent(Timestamp receiveTime)
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
    if ((_revents_ & EPOLLHUP) && !(_revents_ & EPOLLIN))
    {
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
}
