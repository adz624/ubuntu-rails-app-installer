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

# 4. 下載、並設定 bash, vim, gitconfig
git clone https://github.com/afunction/dotfiles .dotfiles
echo -e "\e[31mSetting up bash shell ... \e[0m"
rm -rf .bash_profile
ln -s .dotfiles/bash_profile_ubuntu .bash_profile

echo -e "\e[31mSetting up vim ... \e[0m"
rm -rf .vimrc
ln -s .dotfiles/vimrc .vimrc

echo -e "\e[31mSetting up git ... \e[0m"
rm -rf .gitconfig
ln -s .dotfiles/gitconfig .gitconfig
ln -s .dotfiles/banner .banner

# 5. 更新 vim plugin & bundles
echo -e "\e[31mDownload vim color schema & bundles ... \e[0m"
cd .dotfiles
git submodule init
git submodule update

# 6. Reload bash setting
source ~/.bash_profile

# 7. Download installer for current user
echo -e "\e[31mDownload Installer shell script ... \e[0m"
git clone https://github.com/afunction/ubuntu-rails-app-installer.git installer