#pragma once

#include <unordered_map>
#include <string>
#include <memory>
#include <functional>
#include <atomic>

#include "Callbacks.h"
#include "Acceptor.h"
#include "EventLoopThreadPool.h"
#include "noncopyable.h"
#include "InetAddress.h"
#include "Logger.h"
#include "TcpConnection.h"
#include "EventLoop.h"
#include "Buffer.h"

class EventLoop;

// 提供给外部用的TcpServer类
class TcpServer : noncopyable
{
    using ThreadInitCallback = std::function<void(EventLoop *)>;

public:
    enum Option
    {
        kNoReusePort,
        kReusePort
    };

    TcpServer(EventLoop *loop,
              const InetAddress &listenAddr,
              const std::string &nameArg,
              Option option = kNoReusePort);

    ~TcpServer();

    void setThreadInitCallback(const ThreadInitCallback &cb) { _threadInitCallback_ = cb; }
    void setConnectionCallback(const ConnectionCallback &cb) { _connectionCallback_ = cb; }
    // void setCloseCallback(const CloseCallback &cb) { _closeCallback_ = std::move(cb); }
    void setWriteCompleteCallback(const WriteCompleteCallback &cb) { _writeCompleteCallback_ = cb; }
    void setMessageCallback(const MessageCallback &cb) { _messageCallback_ = cb; }

    void setThreadNum(int numThreads);

    void start();

private:
    void newConnection(int sockfd, const InetAddress &peerAddr);
    void removeConnection(const TcpConnectionPtr &conn);
    void removeConnectionInLoop(const TcpConnectionPtr &conn);

private:
    using ConnectionMap = std::unordered_map<std::string, TcpConnectionPtr>;

    EventLoop *_loop_; // 外部传入的mainloop
    const std::string _ipPort_;
    const std::string _name_;

    std::unique_ptr<Acceptor> _acceptor_; // 用于获取新连接，运行在mainloop中

    std::shared_ptr<EventLoopThreadPool> _threadPool_;

    ConnectionCallback _connectionCallback_;
    // CloseCallback _closeCallback_;
    WriteCompleteCallback _writeCompleteCallback_;
    MessageCallback _messageCallback_;

    ThreadInitCallback _threadInitCallback_;

    std::atomic_int _started_;
    int _nextConnId_;
    ConnectionMap _connectionMap_; // 保存所有连接
};