#!/bin/bash

# enable-auto-login.sh <user> <tty>
# To be run as root

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

# autologin
mkdir -p /etc/systemd/system/getty@tty$2.service.d

echo -e "[Service]\n\
ExecStart=\n\
ExecStart=-/sbin/agetty --autologin $1 --noclear %I 38400 linux"\
> /etc/systemd/system/getty@tty$2.service.d/autologin.conf

chown root /etc/systemd/system/getty@tty$2.service.d/autologin.conf
chgrp root /etc/systemd/system/getty@tty$2.service.d/autologin.conf
chmod 644 /etc/systemd/system/getty@tty$2.service.d/autologin.conf
