#!/bin/bash
# @author eddie li (ADZ)
# @updated_at 2014/9/19
# @version 0.01

echo -e "\e[31m[Linode Private IP] Setup Linode Private IP ...\e[0m"
echo -e "\e[31mPlease Provide IP address ex: 192.168.3.40/17 ...\e[0m"
read -p ":" IP
echo 'auto eth0:0' >> /etc/network/interfaces
echo 'iface eth0:0 inet static'  >> /etc/network/interfaces
echo "address $IP"  >> /etc/network/interfaces
echo -e "\e[31mRestart network ...\e[0m"
ifdown -a && ifup -a
ifconfig
