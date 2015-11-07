#!/bin/bash
# This script is used by vagrant to setup the test box

PACKAGES="htop git planet-venus vim "

# Update
apt-get update -y

# Install needed pakcages
apt-get install $PACKAGES

# Nginx

# Planet
