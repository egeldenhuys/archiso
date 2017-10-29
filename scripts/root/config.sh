#!/bin/bash

# Set custom configurations
timedatectl set-timezone Africa/Johannesburg

systemctl disable choose-mirror.service
systemctl enable NetworkManager

pacman-key --init
pacman-key --populate archlinux
