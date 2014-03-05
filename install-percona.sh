#!/bin/bash
# @author eddie li (ADZ)
# @updated_at 2014/3/5
# @version 0.01

# 1. Add apt source
IF_SOURCE_ADDED=$(cat /etc/apt/sources.list | grep repo.percona.com | wc -l)
if [ $IF_SOURCE_ADDED == 0 ]; then
  # 2. Add percona mysql apt key
  echo -e "\e[31m[Percona] Add percona mysql apt key ...\e[0m"
  apt-key adv --keyserver keys.gnupg.net --recv-keys 1C4CBDCDCD2EFD2A

  UBUNTU_DISTRIB=$(cat /etc/*-release | grep DISTRIB_CODENAME | awk 'BEGIN {FS="="}{print $2}')
  echo -e "\e[31m[Percona] Add percona mysql apt source.list ...\e[0m"
  echo -e "\e[31m[Percona] DISTRIB_CODENAME=$UBUNTU_DISTRIB ...\e[0m"
  echo "deb http://repo.percona.com/apt $UBUNTU_DISTRIB main" >> /etc/apt/sources.list
  echo "deb-src http://repo.percona.com/apt $UBUNTU_DISTRIB main" >> /etc/apt/sources.list

  echo -e "\e[31m[Percona] Update apt list ...\e[0m"
  aptitude update
else
  echo -e "\e[31m[Percona] source exists ...\e[0m"
fi

if [ -f "/usr/bin/mysqld_safe" ]; then
  echo -e "\e[31mMySQL Already Installed, if you want to reinstall again, please remove mysql before run this script ...\e[0m"
else
  # 3. Setting mysql configuration
  echo -e "\e[31m[Percona] Install mysql ...\e[0m"
  aptitude install percona-server-server-5.5 percona-server-client-5.5 -y
  /etc/init.d/mysql stop

  # 4. Setting mysql configuration
  echo -e "\e[31m[Percona] Setting mysql configuration ...\e[0m"
  cp conf/my.cnf /etc/mysql/my.cnf

  # 5. Cleanup mysql log file, to change bigger size
  echo -e "\e[31m[Percona] Clearnup mysql log file ...\e[0m"
  rm -rf /var/lib/mysql/*logfile*

  # 6. Restart percona server
  /etc/init.d/mysql restart
fi

