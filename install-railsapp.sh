#!/bin/bash
# @author eddie li (ADZ)
# @updated_at 2014/3/5
# @version 0.01
DEPLOY_USER='deploy'
NGINX_USER='nginx'
WEB_GROUP='www-data'

# 1. 安裝 node.js for assets pipeline
add-apt-repository ppa:chris-lea/node.js
aptitude update
aptitude install nodejs -y

# 2. 新增 rails application deploy user、加入 sudoer
#    要把 deploy user 加到 web group，因為 static file 也需要 nginx 也需要有權限存取
adduser $DEPLOY_USER -g $DEPLOY_USER -G $WEB_GROUP
echo "$DEPLOY_USER  ALL=(ALL:ALL) ALL" >> /etc/sudoers

# 3. 安裝 deploy user bash
mkdir ~$DEPLOY_USER/.install
cp install-bash.sh ~$DEPLOY_USER/.install
chown -R $DEPLOY_USER:$DEPLOY_USER ~$DEPLOY_USER/.install
su -c 'cd ~/.install && ./install-bash.sh' $DEPLOY_USER