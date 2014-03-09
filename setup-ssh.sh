#!/bin/bash
# @author eddie li (ADZ)
# @updated_at 2014/3/5
# @version 0.01

echo -e "\e[31mSSH Binding IP & Secure Setting ... \e[0m"
sudo cp conf/sshd_config /etc/ssh/sshd_config
sudo /etc/init.d/ssh restart