#!/bin/bash
# This script is used by vagrant to setup the test box

PACKAGES="htop git vim xsltproc"

# Update
apt-get update -y

# Install needed pakcages
apt-get install -y $PACKAGES

# Nginx
wget http://nginx.org/keys/nginx_signing.key
apt-key add nginx_signing.key

cat > /etc/apt/sources.list.d/nginx.list << "EOF"
deb http://nginx.org/packages/ubuntu/ trusty nginx
deb-src http://nginx.org/packages/ubuntu/ trusty nginx
EOF

sudo apt-get update
sudo apt-get install -y nginx


# Planet
git clone https://github.com/rubys/venus.git /srv/venus/source

# Set permissions for vargrant
chown -R ubuntu:ubuntu /srv/venus

# Setup nginx
cat > /etc/nginx/conf.d/planet.plone.org.conf << "EOF"
server {
    listen       80;
    server_name  localhost;

    location / {
        root   /srv/venus/planet.plone.org/public_html;
        index  index.html index.htm;
    }
}
EOF

# Restart nginx
rm /etc/nginx/conf.d/default.conf
service nginx restart
