#!/bin/bash

# patch-sudo.sh <user> <enable [0|1]>
# Allows us to install aur packages without sudo prompt

if [ $2 -eq 1 ]; then
  cp /etc/sudoers /etc/sudoers.orig
  echo "$1 ALL=(ALL) NOPASSWD: /usr/bin/updatedb,/usr/bin/pacman" >> /etc/sudoers
else
  mv -f /etc/sudoers.orig /etc/sudoers
fi
