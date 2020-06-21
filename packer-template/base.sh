#!/bin/bash

echo "debug: Executing scripts/centos/base.sh"

RELEASE=`rpm -q --qf "%{VERSION}" $(rpm -q --whatprovides redhat-release)`
rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-${RELEASE}.noarch.rpm
yum -y update

yum -y install gcc make gcc-c++ kernel-devel kernel-headers perl wget bzip2 vim nano git net-tools

echo "debug: Updating MOTD"


echo "Restarting VM"
shutdown -r now