#pragma once
#include <string>
#include <atomic>
#include <memory>

#include "InetAddress.h"
#include "Callbacks.h"
#include "Timestamp.h"
#include "Buffer.h"
#include "noncopyable.h"

class EventLoop;
class Socket;
class Channel;
class Buffer;

class TcpConnection : noncopyable, public std::enable_shared_from_this<TcpConnection>
{
    enum StateE
    {
        kDisconnected,
        kConnecting,
        kConnected,
        kDisconnecting
    };

public:
    TcpConnection(EventLoop *loop,
                  const std::string &nameArg,
                  int sockfd,
                  const InetAddress &localAddr,
                  const InetAddress &peerAddr);

    ~TcpConnection();

    EventLoop *getLoop() { return _loop_; }
    const std::string &name() const { return _name_; }
    const InetAddress &localAddress() { return _localAddr_; }
    const InetAddress &peerAddress() { return _peerAddr_; }

    bool connected() { return _state_ == kConnected; }

    void send(const std::string &buf); // 发送数据
    void shutdown();

    void setConnectionCallback(const ConnectionCallback &cb) { _connectionCallback_ = cb; }
    void setCloseCallback(const CloseCallback &cb) { _closeCallback_ = cb; }
    void setWriteCompleteCallback(const WriteCompleteCallback &cb) { _writeCompleteCallback_ = cb; }
    void setMessageCallback(const MessageCallback &cb) { _messageCallback_ = cb; }
    void setHightWaterMarkCallback(const HightWaterMarkCallback &cb) { _hightWaterMarkCallback_ = cb; }

    // 建立连接
    void connectEstablished();
    // 连接销毁
    void connectDestroyed();

private:
    void setState(StateE state) { _state_ = state; }

    void handleRead(Timestamp receiveTime);
    void handleWrite();
    void handlerClose();
    void handleError();

    void sendInLoop(const void *message, size_t len);
    void shutdownInLoop();

private:
    // 记录连接的状态

    EventLoop *_loop_;
    const std::string _name_;
    std::atomic_int _state_; // 记录连接的状态
    bool _reading_;

    std::unique_ptr<Socket> _socket_;
    std::unique_ptr<Channel> _channel_;

    const InetAddress _localAddr_;
    const InetAddress _peerAddr_;

    ConnectionCallback _connectionCallback_;
    CloseCallback _closeCallback_;
    WriteCompleteCallback _writeCompleteCallback_;
    MessageCallback _messageCallback_;
    HightWaterMarkCallback _hightWaterMarkCallback_;
    size_t _hightWaterMark_;

    Buffer _inputBuffer_;
    Buffer _outputBuffer_;
};