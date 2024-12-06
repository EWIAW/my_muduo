#pragma once

#include <vector>
#include <unordered_map>

#include "noncopyable.h"
#include "Timestamp.h"

class EventLoop;
class Channel;

// poller作为一个抽象的基类
class Poller : noncopyable
{
public:
    using ChannelLists = std::vector<Channel *>;

    Poller(EventLoop *ownerloop);
    virtual ~Poller() = default;

    // 给所有IO复用保留统一的接口
    virtual Timestamp poll(int timeoutMs, ChannelLists *activeChannel) = 0;
    virtual void updateChannel(Channel *channel) = 0;
    virtual void removeChannel(Channel *Channel) = 0;

    // 判断channel是否在poller中
    bool hasPoller(Channel *Channel) const;

    // Eventloop可以通过该接口获取默认的IO复用的具体实现
    static Poller *newDefaultPoller(EventLoop *loop);

protected:
    // 用于管理sockfd和channel通道的成员变量
    using ChannelMap = std::unordered_map<int, Channel *>;
    ChannelMap _channelmap_;

private:
    EventLoop *_ownerloop_;
};