#!/bin/bash

# Set the mirrorlist to point to only cs.up.ac.za

echo 'Server = http://ftp.cs.up.ac.za/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist
