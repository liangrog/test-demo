#!/bin/bash

# Packages
yum install -y epel-release
yum install -y ansible python-pip mysql-devel python-devel
pip install mysql-python

# SSH keys
cp /home/vagrant/sync/ssh_keys/* /home/vagrant/.ssh/
chown vagrant:vagrant /home/vagrant/.ssh/*
chmod 400 /home/vagrant/.ssh/*

# Provision
runuser -l vagrant -c 'cd /home/vagrant/sync/ansible/ && ansible-playbook -v -i hosts site.yaml' | sed 's/\\n/\n/g'
