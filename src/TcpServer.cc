#include "TcpServer.h"
#include "Logger.h"

static EventLoop *CheckLoopNotNull(EventLoop *loop)
{
    if (loop == nullptr)
    {
        LOG_FATAL("mainloop is null");
    }
    return loop;
}

TcpServer::TcpServer(EventLoop *loop,
                     const InetAddress &listenAddr,
                     const std::string &nameArg,
                     Option option)
    : _loop_(CheckLoopNotNull(loop)),
      _ipPort_(listenAddr.GetIpPort()),
      _name_(nameArg),
      _acceptor_(new Acceptor(loop, listenAddr, option == kReusePort)),
      _threadPool_(new EventLoopThreadPool(loop, _name_)),
      _connectionCallback_(),
      _messageCallback_(),
      _nextConnId_(1),
      _started_(0)
{
    _acceptor_->setNewConnectionCallback(std::bind(&TcpServer::newConnection, this,
                                                   std::placeholders::_1,
                                                   std::placeholders::_2));
}

TcpServer::~TcpServer()
{
}

void TcpServer::setThreadNum(const int numThreads)
{
}

void TcpServer::start()
{
}

void TcpServer::newConnection(int sockfd, const InetAddress &peerAddr)
{
}

void TcpServer::removeConnection(const TcpConnectionPtr &conn)
{
}

void TcpServer::removeConnectionInLoop(const TcpConnectionPtr &conn)
{
}