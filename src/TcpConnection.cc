#include "TcpConnection.h"
#include "Logger.h"
#include "Socket.h"
#include "Channel.h"

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
    _channel_->SetCloseCallback(std::bind(&TcpConnection::handlerClose, this));
    _channel_->SetErrorCallback(std::bind(&TcpConnection::handleError, this));
    _channel_->SetReadCallback(std::bind(&TcpConnection::handleRead, this, std::placeholders::_1));
    _channel_->SetWriteCallback(std::bind(&TcpConnection::handleWrite, this));
}

TcpConnection::~TcpConnection()
{
}