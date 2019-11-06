#!/usr/bin/env bash

ssh-add /vagrant/ssh_key

echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bash_profile
echo "export DOCKER_HOST=172.20.0.1" >> ~/.bash_profile
echo "alias ll='ls -lGAh'" >> ~/.bash_profile
echo "docker='sudo docker'" >> ~/.bash_profile
echo "alias clap='~/dev/repos/cloudify-dev/scripts/clap'" >> ~/.bash_profile
echo "workon cloudify" >> ~/.bash_profile
echo "source /vagrant/envvars.sh" >> ~/.bash_profile
