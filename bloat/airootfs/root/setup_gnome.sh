#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

pacman -S gnome gdm --noconfirm
systemctl enable gdm.service
