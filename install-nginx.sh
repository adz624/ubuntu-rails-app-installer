#!/bin/bash
# @author eddie li (ADZ)
# @updated_at 2014/3/5
# @version 0.01

# 1. add newest nginx repo, update, and install
echo -e "\e[31m[Nginx] Add newest nginx repo, update, install ...\e[0m"
add-apt-repository ppa:nginx/stable
aptitude update
aptitude install nginx -y

# 2. restart nginx (restart nginx)
echo -e "\e[31m[Nginx] Restart ...\e[0m"
/etc/init.d/nginx restart
