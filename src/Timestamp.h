#pragma once

#include <iostream>
#include <string>

class Timestamp
{
public:
    Timestamp();
    explicit Timestamp(const int64_t &seconds);
    static Timestamp Now();
    std::string To_String() const;

private:
    int64_t _seconds_;
};