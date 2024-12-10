
#include "InetAddress.h"

InetAddress::InetAddress(const std::string ip, const uint16_t port)
{
    bzero(&addr_, sizeof(addr_));
    addr_.sin_family = AF_INET;
    addr_.sin_addr.s_addr = inet_addr(ip.c_str());
    addr_.sin_port = htons(port);
}

InetAddress::InetAddress(const struct sockaddr_in &addr)
    : addr_(addr)
{
}

std::string InetAddress::GetIp()
{
    char buffer[32] = {0};
    inet_ntop(AF_INET, &addr_.sin_addr, buffer, sizeof(buffer) - 1);
    return buffer;
}

uint16_t InetAddress::GetPort()
{
    return ntohs(addr_.sin_port);
}

std::string InetAddress::GetIpPort()
{
    char ip[32] = {0};
    char port[32] = {0};
    inet_ntop(AF_INET, &addr_.sin_addr, ip, sizeof(ip));
    snprintf(port, sizeof(port) - 1, "%d", ntohs(addr_.sin_port));
    std::string ret;
    ret += ip;
    ret += " : ";
    ret += port;
    return ret;
}