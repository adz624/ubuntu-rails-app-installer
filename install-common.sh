#!/bin/bash
# @author eddie li (ADZ)
# @updated_at 2014/3/5
# @version 0.01

# 1. 更新 package list
echo -e "\e[31mAptitude - Update & Upgrade\e[0m"
aptitude update && aptitude upgrade

# 2. 安裝常用工具
echo -e "\e[31mInstall common tools\e[0m"
aptitude install curl git-core python-software-properties bash-completion htop iftop tmux vim -y
echo -e "\e[31mDownload the shellscript configuration in current user home dir: ~/$(whoami)\e[0m"
cd ~

# 3. 跳過 public key 檢查
echo -e "\e[31mSkipping SSH HostKeyChecking ... \e[0m"
echo -e "Host github.com\n\tStrictHostKeyChecking no\n" > ~/.ssh/config

# 4. Download installer for current user
echo -e "\e[31mDownload Installer shell script ... \e[0m"
git clone https://github.com/afunction/ubuntu-rails-app-installer.git installer
rm -rf .ssh/config
