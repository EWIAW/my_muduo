#pragma once

#include <vector>

// 整个缓冲区分为三个部分
//-------|-----------------|--------------
//   8   |                 |
//-------|-----------------|--------------
// prepend    reader             writer
// 其中prepend的作用是可以记录reader的大小，方便上层应用
class Buffer
{
public:
    explicit Buffer()
        : _buffer_(kCheapPrepend + kInitiaSize),
          _readerIndex_(kCheapPrepend),
          _writerIndex_(kCheapPrepend)
    {
    }

    ~Buffer() = default;

    // 返回可读数据的大小
    size_t readableBytes() { return _writerIndex_ - _readerIndex_; }

    // 返回可写数据的大小
    size_t writeableBytes() { return _buffer_.size() - _writerIndex_; }

    // 返回prepend的大小
    size_t prependableBytes() { return _readerIndex_; }

    // 返回缓冲区中可读数据的起始地址
    const char *peek() const { return begin() + _readerIndex_; }

private:
    // 返回vector底层首元素数据的地址
    char *begin() { return &*_buffer_.begin(); }
    const char *begin() const { return &*_buffer_.begin(); }

private:
    std::vector<char> _buffer_;
    size_t _readerIndex_;
    size_t _writerIndex_;

    static const size_t kCheapPrepend = 8;
    static const size_t kInitiaSize = 1024;
};
// static成员变量不能直接在类中初始化
// 但是static const成员变量可以在类中初始化