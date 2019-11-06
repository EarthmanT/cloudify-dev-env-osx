#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive
eval `ssh-agent -s`
ssh-add

echo "################################################"
echo "Installing apt-get packages..."
echo "################################################"
apt-get update
apt-get install python-pip -y
apt-get install python2.7-dev -y
apt-get install bridge-utils -y
apt-get install python-dev -y
apt-get install libpq-dev -y
apt-get install gcc -y
apt-get install libffi-dev -y
apt-get install libsasl2-dev -y
apt-get install libldap2-dev -y
apt-get install libssl-dev -y
apt-get install git -y
apt-get install unzip -y
apt-get install wget -y

echo "################################################"
echo "Done"
echo "################################################"
