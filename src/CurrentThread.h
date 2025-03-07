#include <unistd.h>
#include <sys/syscall.h>

#include "Logger.h"

namespace CurrentThread
{
    extern __thread int t_cachedTid;

    void cacheTid();

    // 获取线程id
    inline int tid()
    {
        if (__builtin_expect(t_cachedTid == 0, 0))
        {
            cacheTid();
        }
        return t_cachedTid;
    }
}