#include <iostream>

#include "Logger.h"
#include "Timestamp.h"
#include "InetAddress.h"

// 测试Logger模块
void test1()
{
    LOG_INFO("测试%d", 2);
    LOG_DEBUG("测试%d", 2);
    LOG_ERROR("测试%d", 2);
    LOG_DEBUG("func = %s", __FUNCTION__);
    LOG_FATAL("exit");
    while (1)
    {
    }
}

// 测试Timestamp模块
void test2()
{
    Timestamp ts;
    std::cout << ts.To_String() << std::endl;

    std::cout << Timestamp::Now().To_String() << std::endl;
}

// 测试InetAddress模块
void test3()
{
    InetAddress ia("3489");
    std::cout << ia.GetIp() << std::endl;
    std::cout << ia.GetPort() << std::endl;
    std::cout << ia.GetIpPort() << std::endl;
}

int main()
{
    test1();
    // test2();
    // test3();
    return 0;
}