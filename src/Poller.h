#pragma once

#include <vector>
#include <unordered_map>

#include "noncopyable.h"
#include "Timestamp.h"

class Eventloop;
class Channel;

// poller作为一个抽象的基类
class Poller : noncopyable
{
public:
    using ChannelLists = std::vector<Channel *>;

    Poller(Eventloop *ownerloop);
    virtual ~Poller() = default;

    // 给所有IO复用保留统一的接口
    virtual Timestamp poll(int timeoutMs, ChannelLists *activeChannel) = 0;
    virtual void updataChannel(Channel *channel) = 0;
    virtual void removeChannel(Channel *Channel) = 0;

    // 判断channel是否在poller中
    bool hasPoller(Channel *Channel) const;

    // Eventloop可以通过该接口获取默认的IO复用的具体实现
    static Poller *newDefaultPoller(Eventloop *loop);

protected:
    // 用于管理sockfd和channel通道的成员变量
    using ChannelMap = std::unordered_map<int, Channel *>;
    ChannelMap _channelmap_;

private:
    Eventloop *_ownerloop_;
};