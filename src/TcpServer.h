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
              std::string ipPort,
              std::string name,
              Option option = kNoReusePort);

    ~TcpServer();

    void setThreadInitCallback(const ThreadInitCallback &cb) { _threadInitCallback_ = std::move(cb); }
    void setConnectionCallback(const ConnectionCallback &cb) { _connectionCallback_ = std::move(cb); }
    // void setCloseCallback(const CloseCallback &cb) { _closeCallback_ = std::move(cb); }
    void setWriteCompleteCallback(const WriteCompleteCallback &cb) { _writeCompleteCallback_ = std::move(cb); }
    void setMessageCallback(const MessageCallback &cb) { _messageCallback_ = std::move(cb); }

    void setThreadNum(const int numThreads);

    void start();

private:
    void newConnection(int sockfd, InetAddress &peerAddr);
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

    std::atomic_int _stated_;
    int nextConnId_;
    ConnectionMap _connectionMap; // 保存所有连接
};