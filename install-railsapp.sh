#!/bin/bash
# @author eddie li (ADZ)
# @updated_at 2014/3/5
# @version 0.01
DEPLOY_USER='deploy'
ADMIN_GROUP='sysadmin'

# 1. 安裝 node.js for assets pipeline
add-apt-repository ppa:chris-lea/node.js
aptitude update
aptitude install nodejs -y

# 2. 開一個群組讓 root 加入 (For sudoer)
groupadd $ADMIN_GROUP
usermod -g $ADMIN_GROUP root

# 3. 新增 rails application deploy user
adduser $DEPLOY_USER --ingroup $ADMIN_GROUP