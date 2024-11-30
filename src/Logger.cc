#include <iostream>

#include "Logger.h"

// 获取单例对象
Logger &Logger::Instance()
{
    // static Logger logger();   不能这样写，那是因为这句代码会被编译器识别为函数声明
    static Logger logger;
    return logger;
}

// 设置日志等级
void Logger::Set_Log_Level(int level)
{
    log_level_ = level;
}

// 输出日志信息
// [日志等级][时间] : 日志信息
void Logger::Log(std::string message)
{

}