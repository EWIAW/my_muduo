// 编写日志信息类
#pragma once

#include <string>

#include "noncopyable.h"

enum Log_Level
{
    INFO,  // 信息日志
    DEBUG, // 调式日志
    ERROR, // 错误日志，但不影响后续的运行
    FATAL  // 致命错误，导致程序直接崩溃
};

// 将日志类设计为单例模式
class Logger : noncopyable
{
public:
    static Logger &Instance();
    void Set_Log_Level(int level);
    void Log(std::string message);

private:
    int log_level_; // 日志等级
};