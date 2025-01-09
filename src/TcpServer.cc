#include "TcpServer.h"
#include "Logger.h"
#include "TcpConnection.h"
#include "EventLoop.h"

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
    for (auto &item : _connectionMap_)
    {
        TcpConnectionPtr conn(item.second);
        item.second.reset();

        conn->getLoop()->runInLoop(std::bind(&TcpConnection::connectDestroyed, conn));
    }
}

void TcpServer::setThreadNum(int numThreads)
{
    _threadPool_->setThreadNum(numThreads);
}

void TcpServer::start()
{
    LOG_DEBUG("TcpServer::start");
    if (_started_++ == 0)
    {
        _threadPool_->start(_threadInitCallback_);
        _loop_->runInLoop(std::bind(&Acceptor::listen, _acceptor_.get()));
    }
}

// 有新连接到来的时候所调用的回调
void TcpServer::newConnection(int sockfd, const InetAddress &peerAddr)
{
    // 先通过轮询算法获取一个subloop
    EventLoop *ioLoop = _threadPool_->getNextLoop();
    // 给连接起一个名字
    char buf[64] = {0};
    snprintf(buf, sizeof(buf) - 1, "-%s#%d", _ipPort_.c_str(), _nextConnId_);
    _nextConnId_++;
    std::string connName = _name_ + buf;

    LOG_INFO("TcpServer::newConnection [%s] - new connection [%s] from %s",
             _name_.c_str(), connName.c_str(), peerAddr.GetIpPort().c_str());

    sockaddr_in local;
    bzero(&local, sizeof(local));
    socklen_t addrlen = sizeof(local);
    if (getsockname(sockfd, (sockaddr *)&local, &addrlen) < 0)
    {
        LOG_ERROR("sockets::getLocalAddr");
    }
    InetAddress localAddr(local);

    TcpConnectionPtr conn(new TcpConnection(ioLoop, connName, sockfd, localAddr, peerAddr));
    _connectionMap_[connName] = conn;
    conn->setConnectionCallback(_connectionCallback_);
    conn->setMessageCallback(_messageCallback_);
    conn->setWriteCompleteCallback(_writeCompleteCallback_);

    conn->setCloseCallback(
        std::bind(&TcpServer::removeConnection, this, std::placeholders::_1));

    ioLoop->runInLoop(std::bind(&TcpConnection::connectEstablished, conn));
}

void TcpServer::removeConnection(const TcpConnectionPtr &conn)
{
    _loop_->runInLoop(
        std::bind(&TcpServer::removeConnectionInLoop, this, conn));
}

void TcpServer::removeConnectionInLoop(const TcpConnectionPtr &conn)
{
    LOG_INFO("TcpServer::removeConnectionInLoop [%s] - connection %s",
             _name_.c_str(), conn->name().c_str());

    _connectionMap_.erase(conn->name());
    EventLoop *ioLoop = conn->getLoop();
    ioLoop->queueInLoop(
        std::bind(&TcpConnection::connectDestroyed, conn));
}