#!/bin/bash
cd /home/ubuntu/
sudo fuser -k 8000/tcp
python3 manage.py runserver 0:8000 &>/dev/null &