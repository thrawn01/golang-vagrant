#!/usr/bin/env bash

apt-get update
apt-get install -y apache2 git build-essential python-dev python-virtualenv

echo "export VIRTUAL_ENV_DISABLE_PROMPT=1" >> /home/vagrant/.bashrc
echo "source ~/.virtualenv/bin/activate 2> /dev/null" >> /home/vagrant/.bashrc

virtualenv /home/vagrant/.virtualenv


# Install golang
apt-get update && apt-get -y install curl git make

curl -O https://storage.googleapis.com/golang/go1.6.linux-amd64.tar.gz
mkdir -p /opt/golang
tar -C /opt/golang -zxf go1.6.linux-amd64.tar.gz
mv /opt/golang/go /opt/golang/1.6
ln -s /opt/golang/1.6 /opt/golang/current


echo "export GOROOT=/opt/golang/current" >> /home/vagrant/.profile
echo "export GOPATH=/home/vagrant/Development/go" >> /home/vagrant/.profile
echo "export PATH=\$PATH:\$GOROOT/bin:\$GOPATH/bin" >> /home/vagrant/.profile
echo "export GO15VENDOREXPERIMENT=1" >> /home/vagrant/.profile

source /home/vagrant/.profile
mkdir -p $GOPATH/src $GOPATH/bin

# Install Docker
curl -fsSL https://get.docker.com/ | sh

# Install Glide
mkdir /opt/glide
curl -L -O https://github.com/Masterminds/glide/releases/download/0.8.3/glide-0.8.3-linux-amd64.tar.gz
tar -C /opt/glide -zxf glide-0.8.3-linux-amd64.tar.gz
ln -s /opt/glide/linux-amd64/glide /usr/local/bin

