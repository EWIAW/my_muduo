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

// 用于封装一个TCP连接
class TcpConnection : noncopyable, public std::enable_shared_from_this<TcpConnection>
{
    // 记录连接的状态
    enum StateE
    {
        kDisconnected,
        kConnecting,
        kConnected,
        kDisconnecting
    };

public:
    TcpConnection(EventLoop *loop,
                  const std::string &name,
                  int sockfd,
                  const InetAddress &localAddr,
                  const InetAddress &peerAddr);

    ~TcpConnection();

    EventLoop *getLoop() const { return _loop_; }
    const std::string &name() const { return _name_; }
    const InetAddress &localAddress() const { return _localAddr_; }
    const InetAddress &peerAddress() const { return _peerAddr_; }

    bool connected() const { return _state_ == kConnected; }

    void send(const std::string &buf); // 发送数据
    void shutdown();

    void setConnectionCallback(const ConnectionCallback &cb) { _connectionCallback_ = cb; }
    void setCloseCallback(const CloseCallback &cb) { _closeCallback_ = cb; }
    void setWriteCompleteCallback(const WriteCompleteCallback &cb) { _writeCompleteCallback_ = cb; }
    void setMessageCallback(const MessageCallback &cb) { _messageCallback_ = cb; }
    void setHightWaterMarkCallback(const HightWaterMarkCallback &cb, size_t highWaterMark)
    {
        _hightWaterMarkCallback_ = cb;
        _hightWaterMark_ = highWaterMark;
    }

    // 建立连接
    void connectEstablished();
    // 连接销毁
    void connectDestroyed();

private:
    void setState(StateE state) { _state_ = state; }

    // 下面四个函数对应channel的四个回调
    void handleRead(Timestamp receiveTime);
    void handleWrite();
    void handlerClose();
    void handleError();

    // 在这个TcpConnection所属的EventLoop中发送数据
    void sendInLoop(const void *message, size_t len);
    void shutdownInLoop(); // 关闭连接

private:
    EventLoop *_loop_;
    const std::string _name_;
    std::atomic_int _state_; // 记录连接的状态
    bool _reading_;

    std::unique_ptr<Socket> _socket_;
    std::unique_ptr<Channel> _channel_;

    const InetAddress _localAddr_; // 指的是服务端的地址
    const InetAddress _peerAddr_;  // 指的是客户端的地址

    // 下面五个回调是TcpServer设置给T产品Connection的
    ConnectionCallback _connectionCallback_; // 连接状态变更时调用的回调
    CloseCallback _closeCallback_;
    WriteCompleteCallback _writeCompleteCallback_;
    MessageCallback _messageCallback_;
    HightWaterMarkCallback _hightWaterMarkCallback_;
    size_t _hightWaterMark_;

    Buffer _inputBuffer_;  // 输入缓冲区，即服务器从上面读取客户端的数据
    Buffer _outputBuffer_; // 输出缓冲区，即服务器发送给客户端的数据
};