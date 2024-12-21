#pragma once

#include <functional>

#include "Socket.h"
#include "Channel.h"
#include "InetAddress.h"

class EventLoop;

class Acceptor
{
    using NewConnectionCallback = std::function<void(int sockfd, const InetAddress &)>;

public:
    Acceptor(EventLoop *loop, const InetAddress &listenAddr, bool reuseport);
    ~Acceptor();

    void setNewConnectionCallback(const NewConnectionCallback &cb) { _newConnectionCallback_ = cb; }

    bool listenning() { return _listenning_; }
    void listen();

private:
    void handlerRead();

private:
    EventLoop *_loop_;
    Socket _acceptSocket_;
    Channel _acceptChannel_;
    NewConnectionCallback _newConnectionCallback_;
    bool _listenning_;
};