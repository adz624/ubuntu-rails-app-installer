#!/bin/bash
# @author eddie li (ADZ)
# @updated_at 2014/6/18
# @version 0.01

# Install jdk
apt-get install openjdk-7-jre-headless -y
cd ~

# Download elasticsearch 1.2.1
# Check http://www.elasticsearch.org/download/ for latest version of ElasticSearch and replace wget link below
wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.2.1.deb

# Install & start elasticsearch server
# should run at 0.0.0.0:9200
# check by command `netstat -tln`
dpkg -i elasticsearch-1.2.1.deb
sudo service elasticsearch start