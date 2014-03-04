#!/bin/bash
# @author eddie li (ADZ)
# @updated_at 2014/3/5
# @version 0.01

# 1. 下載、並設定 bash, vim, gitconfig
rm -rf ~/.dotfiles
git clone https://github.com/afunction/dotfiles ~/.dotfiles
echo -e "\e[31mSetting up bash shell ... \e[0m"
rm -rf ~/.bash_profile
ln -s ~/.dotfiles/bash_profile_ubuntu ~/.bash_profile

echo -e "\e[31mSetting up vim ... \e[0m"
rm -rf ~/.vimrc
ln -s ~/.dotfiles/vimrc ~/.vimrc

echo -e "\e[31mSetting up git ... \e[0m"
rm -rf ~/.gitconfig
ln -s ~/.dotfiles/gitconfig .gitconfig
ln -s ~/.dotfiles/banner ~/.banner

# 2. 更新 vim plugin & bundles
echo -e "\e[31mDownload vim color schema & bundles ... \e[0m"
cd ~/.dotfiles
git submodule init
git submodule update

# 3. Reload bash setting
source ~/.bash_profile