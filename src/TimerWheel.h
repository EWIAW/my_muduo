// 时间轮类
#pragma once
#include <sys/timerfd.h>

#include <vector>
#include <memory>
#include <unordered_map>

#include "TimerTask.h"

static int createTimerFd()
{
    int fd = timer_create()
}

// 秒级定时器
class TimerWheel
{
    using WeakTaskPtr = std::weak_ptr<TimerTask>;
    using SharedTaskPtr = std::shared_ptr<TimerTask>;

    static const uint32_t  capacity = 60;//时间轮的长度
public:
    TimerWheel();

private:
    int _timer_fd_;       // 通过timerfd_create系统调用创建定时器的返回值
    uint32_t _tick_;     // 定时器秒针所在的位置
    uint32_t _capacity_; // 定时器的长度

    std::vector<std::vector<SharedTaskPtr>> _wheel_;          // 时间轮
    std::unordered_map<uint64_t, WeakTaskPtr> _weak_ptr_map_; // 存储任务id和任务对象所对应的weak_ptr
};