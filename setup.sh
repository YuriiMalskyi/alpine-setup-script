#!/bin/sh

# Network configuration
ip link set eth0 up
apk update
apk add dhcpcd
dhcpcd eth0

# APK repositories
echo "https://dl-cdn.alpinelinux.org/alpine/v3.21/main" >> /etc/apk/repositories
echo "https://dl-cdn.alpinelinux.org/alpine/v3.21/community" >> /etc/apk/repositories
apk update --no-cache

# Install necessary packages
apk add openjdk17-jre nano

# SSH configuration
rc-service sshd start
rc-update add sshd default
sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config
rc-service sshd restart

# Set root password
passwd

# Create directories
mkdir ~/jar

# Other customizations...
