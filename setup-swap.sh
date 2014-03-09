#!/bin/bash
# @author eddie li (ADZ)
# @updated_at 2014/3/5
# @version 0.01

IF_SWAP_EXISTS=`sudo swapon -s | wc -l`
if [ $IF_SWAP_EXISTS == 1 ]; then
  echo -e "\e[31m[SWAP] Create swap file ...\e[0m"
  sudo dd if=/dev/zero of=/swapfile bs=1024 count=512k
  echo -e "\e[31m[SWAP] Mount swap ...\e[0m"
  sudo mkswap /swapfile
  echo -e "\e[31m[SWAP] Write to /etc/fstab ...\e[0m"
  echo "/swapfile       none    swap    sw      0       0" >> /etc/fstab
else
  echo -e "\e[31m[SWAP] Exists ALREADY ...\e[0m"
fi