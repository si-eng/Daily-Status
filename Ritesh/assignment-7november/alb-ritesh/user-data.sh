#!/bin/bash -xe
  sudo apt-get -y update
  sudo apt-get -y install nginx
  sudo apt-get install -y git
  git clone https://github.com/jtestkc/tempshort.git
  cd /tempshort
  sudo cp -r about.html contact.html css/ fonts/ gallery.html images/ index.html js/ service.html testimonial.html /var/www/html/
  sudo rm /var/www/html/index.nginx-debian.html