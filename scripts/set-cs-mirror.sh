#!/bin/bash

# Overwrites /etc/pacman.d/mirrorlist to only point to ftp.cs.up.ac.za

echo \
"# Set by set-cs-mirror.sh:
Server = http://ftp.cs.up.ac.za/archlinux/$repo/os/$arch" > /etc/pacman.d/mirrorlist
