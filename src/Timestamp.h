#pragma once

#include <iostream>
#include <string>

// 时间戳类
class Timestamp
{
public:
    Timestamp();
    explicit Timestamp(int64_t seconds);
    static Timestamp Now();
    std::string To_String() const;

private:
    int64_t _seconds_;
};