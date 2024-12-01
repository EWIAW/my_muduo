#pragma once

#include <arpa/inet.h>
#include <netinet/in.h>
#include <strings.h>

#include <string>

class InetAddress
{
public:
    explicit InetAddress(const uint16_t port, const std::string ip = "127.0.0.1");
    explicit InetAddress(const struct sockaddr_in &addr);

    std::string GetIp();
    uint16_t GetPort();
    std::string GetIpPort();

private:
    struct sockaddr_in addr_;
};