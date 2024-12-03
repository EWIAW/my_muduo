#include <unistd.h>
#include <sys/syscall.h>
namespace CurrentThread
{
    extern __thread int t_cachedTid;

    void cacheTid();

    inline int tid()
    {
        if (__builtin_expect(tid == 0, 0))
        {
            cacheTid();
        }
        return t_cachedTid;
    }
}