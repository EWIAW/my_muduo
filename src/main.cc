#include <iostream>

#include "Logger.h"
#include "Timestamp.h"
#include "InetAddress.h"

// 测试Logger模块
void test1()
{
    ILOG("测试%d", 2);
    DLOG("测试%d", 2);
    ELOG("测试%d", 2);
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
    InetAddress ia(3489);
    std::cout << ia.GetIp() << std::endl;
    std::cout << ia.GetPort() << std::endl;
    std::cout << ia.GetIpPort() << std::endl;
}

int main()
{
    // test1();
    // test2();
    test3();
    return 0;
}