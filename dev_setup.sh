#!/usr/bin/env bash
HOME=/home/vagrant

echo "################################################"
echo "Installing virtualenvwrapper..."
echo "################################################"
sudo pip install virtualenvwrapper
source /usr/local/bin/virtualenvwrapper.sh
echo "################################################"
echo "Done"
echo "################################################"

echo "################################################"
echo "Installing clap..."
echo "################################################"
echo "Create virtualenv"
mkvirtualenv cloudify

echo "Installing clap requirements"
pip install sh
pip install colorama
pip install argh

CLAP=$HOME/dev/repos/cloudify-dev/scripts/clap
$CLAP install
echo "################################################"
echo "Done"
echo "################################################"


echo "################################################"
echo "Setup docker"
echo "################################################"

#echo 'DOCKER_OPTS="-D -H tcp://172.20.0.1 --bridge cfy0 --dns 8.8.8.8 --dns 8.8.4.4 --mtu 1420"' | sudo tee --append /etc/default/docker
# sudo service docker restart
export DOCKER_HOST=172.20.0.1
echo "################################################"
echo "Done"
echo "################################################"

echo "################################################"
echo "Init docl..."
echo "################################################"
docl init --source-root /home/vagrant/dev/repos --ssh-key-path /vagrant/ssh_key --docker-host 172.20.0.1
docl pull-image
echo "################################################"
echo "Done"
echo "################################################"


