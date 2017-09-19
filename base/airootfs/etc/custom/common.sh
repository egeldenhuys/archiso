#!/bin/bash

# To be executed from iso env as root

systemctl disable choose-mirror.service
systemctl enable NetworkManager

# Set mirrors
cp -f /etc/custom/mirrorlist /etc/pacman.d/mirrorlist

# Add default user account and set passwords
! id arch && useradd -s /usr/bin/zsh -m arch
echo -en "arch\narch" | passwd arch
echo -en "root\nroot" | passwd root
