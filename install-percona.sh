#!/bin/bash
# @author eddie li (ADZ)
# @updated_at 2014/3/5
# @version 0.01

# 1. Add percona mysql apt key
echo -e "\e[31m[Percona] Add percona mysql apt key ...\e[0m"
apt-key adv --keyserver keys.gnupg.net --recv-keys 1C4CBDCDCD2EFD2A

# 2. Add apt source
IF_SOURCE_ADDED=$(cat /etc/apt/sources.list | grep repo.percona.com | wc -l)
if [$IF_SOURCE_ADDED == 0]; then
  UBUNTU_DISTRIB=$(cat /etc/*-release | grep DISTRIB_CODENAME | awk 'BEGIN {FS="="}{print $2}')
  echo -e "\e[31m[Percona] Add percona mysql apt source.list ...\e[0m"
  echo -e "\e[31m[Percona] DISTRIB_CODENAME=$UBUNTU_DISTRIB ...\e[0m"
  echo "deb http://repo.percona.com/apt $UBUNTU_DISTRIB main"
  echo "deb-src http://repo.percona.com/apt $UBUNTU_DISTRIB main"

  echo -e "\e[31m[Percona] Update apt list ...\e[0m"
  aptitude update
else
  echo -e "\e[31m[Percona] source exists ...\e[0m"
fi

echo -e "\e[31m[Percona] Install mysql ...\e[0m"
aptitude install percona-server-server-5.5 percona-server-client-5.5