#include <string>
#include <mutex>

//用于将日志写入磁盘的类模块
class LogFile
{
private:
    const std::string _basename_;//日志文件的基础文件名，如：mylog，实际上会更复杂
    const off_t _rollSize_;//单个日志文件的最大字节数，超过这个长度，则触发滚动，生成新文件
    const int _flushInterval_;//日志刷新间隔，每个 多少 秒，就自动强制将数据写入硬盘
    const int _checkEveryN_;//计数器阈值，

    int _count_;

    std::

public:
};