#!/bin/bash

# Variable Declaration
URL = "https://www.free-css.com/assets/files/free-css-templates/download/page293/hostit.zip"
ART_NAME = "template"
TEMPDIR = "/usr/share/nginx/html"
PACKAGE_NAME = nginx"


# Install Nginx
yum update
yum install -y $PACKAGE_NAME

# Start Nginx service
systemctl start $PACKAGE_NAME

# Download HTML template from tooplate.com
wget -O template.zip $URL
unzip -o template.zip
rm template.zip
mv hostit-html $ART_NAME

# Deploy template to /var/www/html
mv $ART_NAME $TEMPDIR

# Restart Nginx service
systemctl restart $PACKAGE_NAME

cd $TEMPDIR
ls

# Check Nginx status
curl http://localhost/hostit-html