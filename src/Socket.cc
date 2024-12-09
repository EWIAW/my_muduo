#include <sys/types.h>
#include <sys/socket.h>
#include <unistd.h>
#include <netinet/tcp.h>

#include "Socket.h"
#include "Logger.h"

Socket::~Socket()
{
    close(_sockfd_);
}

void Socket::bindAddress(const InetAddress &localaddr)
{
    int ret = bind(_sockfd_, (sockaddr *)localaddr.getSockAddr(), sizeof(sockaddr_in));
    if (ret == -1)
    {
        LOG_FATAL("bind error");
    }
}

void Socket::listen()
{
    int ret = ::listen(_sockfd_, 1024);
    if (ret == -1)
    {
        LOG_FATAL("listen error");
    }
}

int Socket::accept(InetAddress *peeraddr)
{
    sockaddr_in addr;
    socklen_t len = sizeof(addr);
    bzero(&addr, sizeof(addr));
    int connfd = ::accept4(_sockfd_, (sockaddr *)&addr, &len, SOCK_NONBLOCK | SOCK_CLOEXEC);
    if (connfd >= 0)
    {
        peeraddr->setSockAddr(addr);
    }
    return connfd;
}

void Socket::shutdownWrite()
{
    int ret = shutdown(_sockfd_, SHUT_WR);
    if (ret < 0)
    {
        LOG_ERROR("shutdownWrite error");
    }
}

void Socket::setTcpNoDelay(bool on)
{
    int optval = on ? 1 : 0;
    ::setsockopt(_sockfd_, IPPROTO_TCP, TCP_NODELAY, &optval, sizeof(optval));
}

void Socket::setReuseAddr(bool on)
{
    int optval = on ? 1 : 0;
    ::setsockopt(_sockfd_, SOL_SOCKET, SO_REUSEADDR, &optval, sizeof(optval));
}

void Socket::setReusePort(bool on)
{
    int optval = on ? 1 : 0;
    ::setsockopt(_sockfd_, SOL_SOCKET, SO_REUSEPORT, &optval, sizeof(optval));
}

void Socket::setKeepAlive(bool on)
{
    int optval = on ? 1 : 0;
    ::setsockopt(_sockfd_, SOL_SOCKET, SO_KEEPALIVE, &optval, sizeof(optval));
}