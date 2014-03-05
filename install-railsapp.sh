#!/bin/bash
# @author eddie li (ADZ)
# @updated_at 2014/3/5
# @version 0.01
DEPLOY_USER='deploy'
NGINX_USER='nginx'
WEB_GROUP='www-data'
RUBY_VERSION='2.1.0'

# 1. 安裝 node.js for assets pipeline
echo -e "\e[31m[RailsAPP] Installing runtime js library for assets pipelie ...\e[0m"
echo -e "\e[31m[RailsAPP] Add node.js source for apt ...\e[0m"
add-apt-repository ppa:chris-lea/node.js -y
echo -e "\e[31m[RailsAPP] Update apt package list and install node.js ...\e[0m"
aptitude update
aptitude install nodejs -y

# 2. 新增 rails application deploy user
echo -e "\e[31m[RailsAPP] Create deploy user = $DEPLOY_USER ...\e[0m"
useradd $DEPLOY_USER -m -G $WEB_GROUP -s /bin/bash

# 3. 授權 public key 登入 deploy user
mkdir /home/$DEPLOY_USER/.ssh/
cp ~/.ssh/authorized_keys /home/$DEPLOY_USER/.ssh/authorized_keys

# 4. 加入 sudoer 要把 deploy user 加到 web group，因為 static file 也需要 nginx 也需要有權限存取
echo -e "\e[31m[RailsAPP] Add deploy user to sudoer list ...\e[0m"
echo "$DEPLOY_USER  ALL=(ALL:ALL) ALL" >> /etc/sudoers

# 5. 安裝 deploy user bash
echo -e "\e[31m[RailsAPP] Setting deploy user bash config ...\e[0m"
mkdir /home/$DEPLOY_USER/.install
cp install-bash.sh /home/$DEPLOY_USER/.install
chown -R $DEPLOY_USER:$DEPLOY_USER /home/$DEPLOY_USER
su -c "cd /home/$DEPLOY_USER/.install && ./install-bash.sh" $DEPLOY_USER

# 6. 安裝 rvm stable
echo -e "\e[31m[RailsAPP] Installing RVM ...\e[0m"
su -l -c "\curl -sSL https://get.rvm.io | bash -s stable" $DEPLOY_USER

# 7. 更新 RVM
echo -e "\e[31m[RailsAPP] Update RVM ...\e[0m"
su -l -c "rvm get head" $DEPLOY_USER

# 8. 安裝 Ruby + Bundler
echo -e "\e[31m[RailsAPP] Installing Ruby $RUBY_VERSION ...\e[0m"
su -l -c "rvm install $RUBY_VERSION" $DEPLOY_USER
su -l -c "rvm --default use $RUBY_VERSION" $DEPLOY_USER

echo -e "\e[31m[RailsAPP] Installing Bundler ...\e[0m"
su -l -c "gem install bundler" $DEPLOY_USER

# 9. 產生 deploy key (跳過所有詢問視窗)
su -l -c "ssh-keygen -f .ssh/id_rsa -t rsa -N '' && echo -e '\e[31m[RailsAPP] Please copy the deploy key paste to your github repo, make sure this key can pull your project ...\e[0m' && cat .ssh/id_rsa.pub" $DEPLOY_USER


# 10. 安裝 mysql lib client for gem => mysql2
sudo apt-get install libmysqlclient-dev -y