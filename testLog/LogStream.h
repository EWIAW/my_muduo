#include <string.h>
#include <string>

// 缓冲区的大小
static const int kSmallBuffer = 4096;
static const int kLargeBuffer = 4096 * 10;

// 一个服务于日志的缓冲区
template <int SIZE>
class FixedBuffer
{
private:
    char _data_[SIZE]; // 缓冲区字符数组
    char *_cur_;       // 目前缓冲区可写入的位置

private:
    const char *end() const // 返回缓冲区末尾的位置
    {
        return _data_ + sizeof(_data_);
    }

public:
    FixedBuffer()
        : _cur_(_data_)
    {
    }

    ~FixedBuffer() {}

    void append(const char *buf, int len) // 向缓冲区追加数据
    {
        if (avail() > len)
        {
            memcpy(_cur_, buf, len);
            _cur_ += len;
        }
    }

    int avail() const { return static_cast<int>(end() - _cur_); }   // 返回缓冲区剩余的空间大小
    const char *data() const { return _data_; }                     // 返回缓冲区头位置
    int length() const { return static_cast<int>(_cur_ - _data_); } // 返回已写入数据的大小
    char *current() const { return _cur_; }                         // 返回可以写入的位置
    void add(int len) { _cur_ += len; }
    void reset() { _cur_ = _data_; } // 重置_cur_指针
    void bzero() { memset(_data_, 0, sizeof(_data_)); }
    std::string toString() const { return string(_data_, length()); }
};

class LogStream
{
    using Buffer = FixedBuffer<kSmallBuffer>;
    using self = LogStream;

private:
    static const int kMaxNumericSize = 48; // 一个最大上限值，确保将数字转换为字符串时，不会出现溢出的情况
    Buffer _buffer_;

private:
    template <class T>
    void formatInteger(T); // 一个函数将数字转换为字符串，并且追加到缓冲区中

public:
    self &operator<<(short);
    self &operator<<(unsigned short);
    self &operator<<(int);
    self &operator<<(unsigned int);
    self &operator<<(long);
    self &operator<<(unsigned long);
    self &operator<<(long long);
    self &operator<<(unsigned long long);
};