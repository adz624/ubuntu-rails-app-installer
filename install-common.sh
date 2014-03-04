#!/bin/sh
aptitude update
aptitude upgrade
# 安裝常用工具
aptitude install curl git-core python-software-properties bash-completion htop iftop tmux -y
cd ~
git clone https://github.com/afunction/dotfiles .dotfiles
# 設定 bash, vim, gitconfig
rm -rf .bash_profile
rm -rf .vimrc
rm -rf .gitconfig
ln -s .dotfiles/bash_profile_ubuntu .bash_profile
ln -s .dotfiles/vimrc .vimrc
ln -s .dotfiles/gitconfig .gitconfig
cd .dotfiles
# 更新 vim,
git submodule init
git submodule update


git clone git@github.com:afunction/ubuntu-rails-app-installer.git installer