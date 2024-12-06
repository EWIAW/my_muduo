#include <unistd.h>

#include <strings.h>

#include "EPollPoller.h"
#include "Logger.h"
#include "Channel.h"

const int kNew = -1;    // channel未添加到poller中
const int kAdded = 1;   // channel已添加到poller中
const int kDeleted = 2; // channel已从poller中删除

EPollPoller::EPollPoller(EventLoop *loop)
    : Poller(loop),
      _events_(kInitEventListSize),
      _epollfd_(epoll_create1(EPOLL_CLOEXEC))
{
    if (_epollfd_ < 0)
    {
        LOG_FATAL("epoll_create failed");
    }
}

EPollPoller::~EPollPoller()
{
    close(_epollfd_);
}

// 重写基类Poller抽象方法
// 进行epoll_wait的封装
Timestamp EPollPoller::poll(int timeoutMs, ChannelLists *activeChannel)
{
    int numEvents = epoll_wait(_epollfd_, &*_events_.begin(), _events_.size(), timeoutMs);
    int saveErrno = errno;
    Timestamp now = Timestamp::Now();
    if (numEvents > 0)
    {
        LOG_INFO("epoll_wait success , event nums : %d", numEvents);
        fillActiveChannel(numEvents, activeChannel);
        // 给_events_扩容，说明此时就绪的事件>=容量，需要扩容
        if (numEvents == _events_.size())
        {
            _events_.resize(2 * _events_.size());
        }
    }
    else if (numEvents == 0)
    {
        LOG_INFO("time out!!!");
    }
    else
    {
        if (saveErrno != EINTR)
        {
            errno = saveErrno;
            LOG_FATAL("epoll_wait failed");
        }
    }
    return now;
}

// 从poller中更新channel
void EPollPoller::updateChannel(Channel *channel)
{
    const int index = channel->index();
    if (index == kNew || index == kDeleted) // 说明channel重来没有添加过，或者已经删除了
    {
        if (index == kNew)
        {
            int fd = channel->fd();
            _channelmap_[fd] = channel;
        }

        channel->Set_Index(kAdded);
        update(EPOLL_CTL_ADD, channel);
    }
    else // 说明channel已经在poller中注册过了
    {
        if (channel->IsNoneEvent())
        {
            update(EPOLL_CTL_DEL, channel);
            channel->Set_Index(kDeleted);
        }
        else
        {
            update(EPOLL_CTL_MOD, channel);
        }
    }
}

// 从poller中删除channel
void EPollPoller::removeChannel(Channel *channel)
{
    int fd = channel->fd();
    _channelmap_.erase(fd);

    int index = channel->index();
    if (index == kAdded)
    {
        update(EPOLL_CTL_DEL, channel);
    }
    channel->Set_Index(kNew);
}

// 填写活跃的连接
void EPollPoller::fillActiveChannel(int numEvents, ChannelLists *activeChannels) const
{
    for (int i = 0; i < numEvents; i++)
    {
        Channel *channel = static_cast<Channel *>(_events_[i].data.ptr);
        channel->SetRevents(_events_[i].events);
        activeChannels->push_back(channel);
    }
}

// 更新channel通道
// 即进行epoll_ctl系统调用的封装
void EPollPoller::update(int operation, Channel *channel)
{
    int fd = channel->fd();

    struct epoll_event event;
    bzero(&event, sizeof(event));
    event.data.ptr = channel;
    event.data.fd = fd;
    event.events = channel->events();

    if (epoll_ctl(_epollfd_, operation, fd, &event) < 0)
    {
        if (operation == EPOLL_CTL_DEL)
        {
            LOG_ERROR("epoll delete failed!!!");
        }
        else
        {
            LOG_ERROR("epoll add/mod failed!!!");
        }
    }
}