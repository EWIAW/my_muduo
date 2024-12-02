#include <unistd.h>

#include "EPollPoller.h"
#include "Logger.h"

const int kNew = -1;    // channel未添加到poller中
const int kAdded = 1;   // channel已添加到poller中
const int kDeleted = 2; // channel已从poller中删除

EPollPoller::EPollPoller(Eventloop *loop)
    : Poller(loop),
      _events_(kInitEventListSize),
      _epollfd_(epoll_create1(EPOLL_CLOEXEC))
{
    if (_epollfd_ < 0)
    {
        ELOG("epoll_create failed");
        exit(-1);
    }
}

EPollPoller::~EPollPoller()
{
    close(_epollfd_);
}
