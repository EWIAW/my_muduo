#pragma once

#include <functional>
#include <memory>

#include "noncopyable.h"
#include "Timestamp.h"

class Eventloop;

// Channel为通过，用于封装sockfd和epoll需要监听的事件，还绑定了poller返回的具体事件
class Channel
{
public:
    using EventCallback = std::function<void()>;
    using ReadEventCallback = std::function<void(Timestamp)>;

    Channel(Eventloop *loop, int fd);
    ~Channel();

    // fd得到poller通知后，处理事件
    void HandlerEvent(Timestamp receiveTime);

    // 设置回调函数对象
    void SetReadCallback(ReadEventCallback cb) { _ReadCallback_ = std::move(cb); }
    void SetWriteCallback(EventCallback cb) { _WriteCallback_ = std::move(cb); }
    void SetCloseCallback(EventCallback cb) { _CloseCallback_ = std::move(cb); }
    void SetErrorCallback(EventCallback cb) { _ErrorCallback_ = std::move(cb); }

    // 防止channel被收到remove掉，channel还在执行回调
    void tie(const std::shared_ptr<void> &);

    int fd() const { return _fd_; }
    int events() { return _events_; }
    int SetRevents(int revents) { _revents_ = revents; }

    // 设置fd相应的事件状态
    void EnableReading()
    {
        _events_ |= kReadEvent;
        update();
    }
    void DisableReading()
    {
        _events_ &= ~kReadEvent;
        update();
    }
    void EnableWriting()
    {
        _events_ |= kWriteEvent;
        update();
    }
    void DisableWriting()
    {
        _events_ &= ~kWriteEvent;
        update();
    }

    // 返回fd当前事件状态
    bool IsNoneEvent() const { return _events_ == kNoneEvent; }
    bool IsReading() { return _events_ & kReadEvent; }
    bool IsWriting() { return _events_ & kWriteEvent; }

    int index() { return _index_; }
    void Set_Index(int index) { _index_ = index; }

    Eventloop *ownerloop() { return _loop_; }
    void remove();

private:
    void update();
    void HandlerEventWithGuard(Timestamp receiveTime);

    // 保存事件可读可写的状态
    static const int kNoneEvent;
    static const int kReadEvent;
    static const int kWriteEvent;

    Eventloop *_loop_;
    const int _fd_;
    int _events_;  // 注册fd所监听的事件
    int _revents_; // 返回fd就绪的事件
    int _index_;

    std::weak_ptr<void> _tie_;
    bool _tied_;

    // 所发生事件的回调
    ReadEventCallback _ReadCallback_;
    EventCallback _WriteCallback_;
    EventCallback _CloseCallback_;
    EventCallback _ErrorCallback_;
};