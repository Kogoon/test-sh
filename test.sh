#!/bin/bash

sudo dnf update -y 
sudo dnf install -y httpd wget php-fpm php-fpm php-mysqli php-json php php-devel
sudo dnf install -y mariadb105-server

sudo systemctl enable --now httpd

sudo usermod -aG apache ec2-user

sudo chown -R ec2-user:apache /var/www
sudo chmod 2775 /var/www && find /var/www -type d -exec sudo chmod 2775 {} \;
sudo find /var/www -type f -exec sudo chmod 0664 {} \;

echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php