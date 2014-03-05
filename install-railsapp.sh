#!/bin/bash
# @author eddie li (ADZ)
# @updated_at 2014/3/5
# @version 0.01
DEPLOY_USER='deploy'
NGINX_USER='nginx'
WEB_GROUP='www-data'

# 1. 安裝 node.js for assets pipeline
echo -e "\e[31m[RailsAPP] Install runtime javascript library for assets pipelie ...\e[0m"
echo -e "\e[31m[RailsAPP] Add node.js source for apt ...\e[0m"
add-apt-repository ppa:chris-lea/node.js -y
echo -e "\e[31m[RailsAPP] Update apt package list and install node.js ...\e[0m"
aptitude update
aptitude install nodejs -y

# 2. 新增 rails application deploy user
useradd $DEPLOY_USER -m -G $WEB_GROUP -s /bin/bash
echo -e "\e[31m[RailsAPP] Setting Deploy user password ...\e[0m"
passwd $DEPLOY_USER


# 3. 加入 sudoer 要把 deploy user 加到 web group，因為 static file 也需要 nginx 也需要有權限存取
echo -e "\e[31m[RailsAPP] Add deploy user to sudoer list ...\e[0m"
echo "$DEPLOY_USER  ALL=(ALL:ALL) ALL" >> /etc/sudoers

# 3. 安裝 deploy user bash
echo -e "\e[31m[RailsAPP] Setting deploy user bash config ...\e[0m"
mkdir /home/$DEPLOY_USER/.install
cp install-bash.sh /home/$DEPLOY_USER/.install
chown -R $DEPLOY_USER:$DEPLOY_USER /home/$DEPLOY_USER/.install
su -c 'cd /home/$DEPLOY_USER/.install && ./install-bash.sh' $DEPLOY_USER