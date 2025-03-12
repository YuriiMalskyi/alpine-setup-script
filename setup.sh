#!/bin/sh

# Set root password
passwd

# Network configuration
ip link set eth0 up

# APK repositories
echo "https://dl-cdn.alpinelinux.org/alpine/v3.21/main" >> /etc/apk/repositories
echo "https://dl-cdn.alpinelinux.org/alpine/v3.21/community" >> /etc/apk/repositories
apk update --no-cache

# Install necessary packages
apk add dhcpcd openssh nano openjdk17-jre maven
dhcpcd eth0

# SSH configuration
apk add 
rc-service sshd start
rc-update add sshd default
sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config
rc-service sshd restart

# Create directories
mkdir ~/jar

# Other customizations...
