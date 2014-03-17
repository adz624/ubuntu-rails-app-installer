#!/bin/bash
# @author eddie li (ADZ)
# @updated_at 2014/3/5
# @version 0.01

echo -e "\e[31m[RailsAPP] Installing runtime js library for assets pipelie ...\e[0m"
echo -e "\e[31m[UFW] Setup the firewall rules, please provide your ip for manage this machine ...\e[0m"
echo -e "\e[31m\tExample\e[0m"
echo -e "\e[31m\t\t192.168.1.0/32\e[0m"
echo -e "\e[31m\t\t210.23.47.176\e[0m"
read -p "Your IP Address?" IP
sudo ufw default deny
sudo ufw allow from $IP
sudo ufw allow 80
sudo ufw allow 443
sudo ufw enable
echo -e "\e[31m[UFW] Done! below is your firewall rules\e[0m"
sudo ufw status