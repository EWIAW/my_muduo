#pragma once

#include <arpa/inet.h>
#include <netinet/in.h>
#include <strings.h>

#include <string>

class InetAddress
{
public:
    explicit InetAddress(const std::string ip = "127.0.0.1", const uint16_t port = 0);
    explicit InetAddress(const struct sockaddr_in &addr);

    std::string GetIp() const;
    uint16_t GetPort() const;
    std::string GetIpPort() const;

    const sockaddr_in *getSockAddr() const { return &addr_; }
    void setSockAddr(const struct sockaddr_in &addr) { addr_ = addr; }

private:
    struct sockaddr_in addr_;
};