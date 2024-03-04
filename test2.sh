#!/bin/bash

sudo systemctl enable --now mariadb

sudo dnf install php-mbstring php-xml -y
sudo systemctl restart php-fpm 

wget https://wordpress.org/latest.tar.gz -P /tmp/
tar -xzf /tmp/latest.tar.gz
mv /tmp/wordpress/* /var/www/html/


