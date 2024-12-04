#include "Eventloop.h"
#include "Channel.h"

Eventloop::Eventloop()
    : _looping_(false),
      _quit_(false),
      _threadId_(CurrentThread::tid()),
      _pollReturnTIme_(0),
      _poller_(Poller::newDefaultPoller(this)),
      _wakeupFd_(0),
      _wakeupChannel_(new Channel(this, _wakeupFd_)),
      _callingPendingFunctors_(false)
{
}

Eventloop::~Eventloop()
{
}