#pragma once

#include <sys/epoll.h>

#include <vector>

#include "Poller.h"
#include "Timestamp.h"

class EventLoop;
class Channel;

// 这个类主要是封装epoll的操作
// 如epoll_create,epoll_ctl,epoll_wait;
class EPollPoller : public Poller
{
    using EventList = std::vector<struct epoll_event>;

public:
    EPollPoller(EventLoop *loop);
    ~EPollPoller() override;

    // 重写基类Poller抽象方法
    Timestamp poll(int timeoutMs, ChannelLists *activeChannel) override;
    void updateChannel(Channel *channel) override;
    void removeChannel(Channel *channel) override;

private:
    // 填写活跃的连接，将底层fd所发生的事件填写到EventLoop的ChannelLists中
    void fillActiveChannel(int numEvents, ChannelLists *activeChannels) const;
    // 更新channel通道
    void update(int operation, Channel *channel);

private:
    // 用于初始化EventList的大小
    static const int kInitEventListSize = 16;
    int _epollfd_;
    EventList _events_; // 通过epoll_wait所得到的就绪事件都存储再这个vector中
};