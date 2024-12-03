#pragma once

#include <sys/epoll.h>

#include <vector>

#include "Poller.h"
#include "Timestamp.h"

class Eventloop;

// 这个类主要是封装epoll的操作
// 如epoll_create,epoll_ctl,epoll_wait;
class EPollPoller : public Poller
{
public:
    EPollPoller(Eventloop *loop);
    ~EPollPoller() override;

    // 重写基类Poller抽象方法
    Timestamp poll(int timeoutMs, ChannelLists *activeChannel) override;
    void updateChannel(Channel *channel) override;
    void removeChannel(Channel *channel) override;

private:
    // 用于初始化EventList的大小
    static const int kInitEventListSize = 16;
    // 填写活跃的连接
    void fillActiveChannel(int numEvents, ChannelLists *activeChannels) const;
    // 更新channel通道
    void update(int operation, Channel *channel);

    using EventList = std::vector<struct epoll_event>;
    int _epollfd_;
    EventList _events_;
};