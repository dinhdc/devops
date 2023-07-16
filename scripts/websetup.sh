#!/bin/bash

# Install Nginx
yum update
yum install -y nginx

# Start Nginx service
systemctl start nginx

# Download HTML template from tooplate.com
wget -O template.zip https://www.free-css.com/assets/files/free-css-templates/download/page293/hostit.zip
unzip -o template.zip
rm template.zip
mv hostit-html template

# Deploy template to /var/www/html
mv template /var/www/html

# Restart Nginx service
systemctl restart nginx

cd /var/www/html
ls

# Check Nginx status
curl http://localhost/hostit-html