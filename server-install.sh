#!/bin/bash
#this code is tested un fresh 2016-02-09-raspbian-jessie-lite Raspberry Pi image
#sudo raspi-config -> extend partition -> reboot
#sudo su
#apt-get update -y && apt-get upgrade -y && apt-get install git -y
#git clone https://github.com/catonrug/raspbian-zabbix-3-sqlite3.git && cd raspbian-zabbix-3-sqlite3 && chmod +x agent-install.sh server-install.sh
#./server-install.sh

apt-get update -y && apt-get upgrade -y
apt-get install libsqlite3-dev -y
apt-get install apache2 apache2-dev -y
apt-get install php5 php5-dev php5-gd -y
apt-get install fping -y
apt-get install libiksemel-dev -y
apt-get install libxml2-dev -y
apt-get install libsnmp-dev -y
apt-get install libssh2-1-dev -y
apt-get install libopenipmi-dev -y
apt-get install libcurl4-openssl-dev -y

groupadd zabbix
useradd -g zabbix zabbix
mkdir -p /var/log/zabbix
chown -R zabbix:zabbix /var/log/zabbix/
mkdir -p /var/zabbix/alertscripts
mkdir -p /var/zabbix/externalscripts
chown -R zabbix:zabbix /var/zabbix/
tar -vzxf zabbix-*.tar.gz -C ~
cd ~/zabbix-*/database/sqlite3

cd ~/zabbix-*/
./configure --enable-server --enable-agent --with-sqlite3 --with-libcurl --with-libxml2 --with-ssh2 --with-net-snmp --with-openipmi --with-jabber


#apt-get install make gcc libc6-dev-dev libmysqlclient libcurl4-openssl-dev-dev libssh2-1 libsnmp-dev libiksemel-dev sqlite3 libsqlite3-dev-dev libopenipmi 
#apt-get install fping php5-gd-base snmp libsnmp openjdk-6-jdk unixodbc unixodbc dev libxml2 libxml2-dev snmp-mibs-downloader snmpd SNMPTT python-pywbem php5-ldap traceroute
