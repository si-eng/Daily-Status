#!/bin/bash
cd /home/ubuntu
sudo apt-get update
sudo apt-get install python3-pip apache2 libapache2-mod-wsgi-py3 -y
pip3 install django
apt install virtualenv -y
apt install python-pip -y
virtualenv env
source env/bin/activate