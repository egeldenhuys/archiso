#!/bin/bash

# install-dotfiles-bootstrap.sh <user> <repo>
# Copies the install-dotfiles.sh to the user home and set
# permissons

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
install_script="install-dotfiles.sh"

cp -f $DIR/$install_script /home/$1
chown $1 /home/$1/$install_script
chgrp $1 /home/$1/$install_script
chmod 755 /home/$1/$install_script

sudo -u $1 -H /home/$1/$install_script $2
