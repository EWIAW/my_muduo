#include "TcpConnection.h"
#include "Logger.h"
#include "Socket.h"
#include "Channel.h"
#include "EventLoop.h"

static EventLoop *CheckLoopNotNull(EventLoop *loop)
{
    if (loop == nullptr)
    {
        LOG_FATAL("mainloop is null");
    }
    return loop;
}

TcpConnection::TcpConnection(EventLoop *loop,
                             const std::string &nameArg,
                             int sockfd,
                             const InetAddress &localAddr,
                             const InetAddress &peerAddr)
    : _loop_(CheckLoopNotNull(loop)),
      _name_(nameArg),
      _state_(kConnecting),
      _reading_(true),
      _socket_(new Socket(sockfd)),
      _channel_(new Channel(loop, sockfd)),
      _localAddr_(localAddr),
      _peerAddr_(peerAddr),
      _hightWaterMark_(64 * 1024 * 1024)
{
    _channel_->SetReadCallback(std::bind(&TcpConnection::handleRead, this, std::placeholders::_1));
    _channel_->SetCloseCallback(std::bind(&TcpConnection::handlerClose, this));
    _channel_->SetErrorCallback(std::bind(&TcpConnection::handleError, this));
    _channel_->SetWriteCallback(std::bind(&TcpConnection::handleWrite, this));

    LOG_INFO("TcpConnection is conneceted : name : %s , fd : %d", _name_.c_str(), sockfd);
    _socket_->setKeepAlive(true);
}

TcpConnection::~TcpConnection()
{
    LOG_INFO("TcpConnection is conneceted : name : %s , fd : %d , state : %d",
             _name_.c_str(), _socket_->fd(), (int)_state_);
}

void TcpConnection::send(const std::string &buf) // 发送数据
{
    if (_state_ == kConnected)
    {
        if (_loop_->isInLoopThread())
        {
            sendInLoop(buf.c_str(), buf.size());
        }
        else
        {
            _loop_->runInLoop(std::bind(&TcpConnection::sendInLoop, this, buf.c_str(), buf.size()));
        }
    }
}

void TcpConnection::shutdown()
{
}

// 建立连接
void TcpConnection::connectEstablished()
{
}
// 连接销毁
void TcpConnection::connectDestroyed()
{
}

void TcpConnection::handleRead(Timestamp receiveTime)
{
}
void TcpConnection::handleWrite()
{
}
void TcpConnection::handlerClose()
{
}
void TcpConnection::handleError()
{
}

void TcpConnection::sendInLoop(const void *message, size_t len)
{
}
void TcpConnection::shutdownInLoop()
{
}