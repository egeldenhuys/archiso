#!/bin/bash

set -e -u

sed -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen
locale-gen

ln -sf /usr/share/zoneinfo/UTC /etc/localtime

usermod -s /usr/bin/zsh root

cp -aT /etc/skel/ /root/
chmod 700 /root

sed -i 's/#\(PermitRootLogin \).\+/\1yes/' /etc/ssh/sshd_config
sed -i 's/#\(Storage=\)auto/\1volatile/' /etc/systemd/journald.conf
sed -i 's/#\(HandleSuspendKey=\)suspend/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleHibernateKey=\)hibernate/\1ignore/' /etc/systemd/logind.conf
sed -i 's/#\(HandleLidSwitch=\)suspend/\1ignore/' /etc/systemd/logind.conf

systemctl enable pacman-init.service
systemctl set-default multi-user.target

systemctl enable NetworkManager

# Configure sudo
cp -f /etc/custom/sudoers /etc/sudoers

# Set mirrors
cp -f /etc/custom/mirrorlist /etc/pacman.d/mirrorlist

# # Set proxy
# cp -f /etc/custom/environment /etc/environment

# Add default user account and set passwords
bash /etc/custom/scripts/create-default-user.sh

# Init user environment

DEFAULT_USER=arch

cp /etc/custom/scripts/ /home/$DEFAULT_USER/.scripts

chown -R $DEFAULT_USER /home/$DEFAULT_USER/.scripts/
chgrp -R $DEFAULT_USER /home/$DEFAULT_USER/.scripts/
chmod -R 755 /home/$DEFAULT_USER/.scripts/

# Install pacaur
sudo -u arch bash /home/$DEFAULT_USER/.scripts/install-pacaur.sh

# Install telegram-desktop-bin
sudo -u arch bash /etc/custom/scripts/install-aur-packages.sh

# Configure user environment
sudo -u arch bash /home/$DEFAULT_USER/.scripts/init-as-user.sh

echo -en "password\npassword" | passwd root
