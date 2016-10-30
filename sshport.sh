#!/bin/bash

###########################################
#        Centos New SSH Port              #"
#      Intro: http://www.anenv.com        #
#      Author: Anenv(anenv@live.cn)       #
###########################################

clear
echo ""
echo "###########################################"
echo "#        Centos New SSH Port              #"
echo "#      Intro: http://www.anenv.com        #"
echo "#      Author: Anenv(anenv@live.cn)       #"
echo "###########################################"
echo ""

#Disable SeLinux
if [ -s /etc/selinux/config ]; then
	sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config
fi

echo "Input New SSH Port:"
read sshport

echo "Port ${sshport}" >> /etc/ssh/sshd_config

iptables -A INPUT -p tcp -m tcp --dport $sshport -j ACCEPT

/etc/init.d/iptables restart 
/etc/init.d/sshd restart 