#!/bin/bash
# @author eddie li (ADZ)
# @updated_at 2014/6/18
# @version 0.01

# Optimization ipv 4 tcp connection
echo 'net.ipv4.tcp_syncookies=1' >> /etc/sysctl.conf
echo 'net.ipv4.tcp_tw_reuse=1' >> /etc/sysctl.conf
echo 'net.ipv4.tcp_tw_recycle=1' >> /etc/sysctl.conf
echo 'net.ipv4.tcp_fin_timeout=30' >> /etc/sysctl.conf
echo 'net.ipv4.tcp_keepalive_time=120' >> /etc/sysctl.conf

# Disable IPv6
echo 'net.ipv6.conf.all.disable_ipv6 = 1' >> /etc/sysctl.conf
echo 'net.ipv6.conf.default.disable_ipv6 = 1' >> /etc/sysctl.conf
echo 'net.ipv6.conf.lo.disable_ipv6 = 1' >> /etc/sysctl.conf
echo 'net.ipv6.conf.eth0.disable_ipv6 = 1' >> /etc/sysctl.conf

# Reload sysctl.conf (need root)
sysctl -p /etc/sysctl.conf