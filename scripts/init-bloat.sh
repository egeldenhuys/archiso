#!/bin/bash

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

user="arch"
user_home=/home/$user
password="password"
tty=1 # For auto login
sudo=1 # Flag to enable sudo for $user

dotfiles_repo="https://github.com/egeldenhuys/dotfiles"
user_script_dir=$user_home/.bootstrap

###########################
# ROOT
#############

# Configurations and fixes
bash $DIR/root/config.sh

# Initialise user
bash $DIR/root/create-user.sh $user $password $sudo
bash $DIR/root/enable-sudo.sh
bash $DIR/root/enable-auto-login.sh $user $tty

# Copy scripts to user home
rm -fr $user_script_dir
bash $DIR/root/bootstrap-dir.sh $user $DIR/user/ $user_script_dir/

###########################
# USER
############

# Clone aui repo
sudo -u $user -H bash $user_script_dir/clone-aui.sh

# Link default dotfiles
tmp_script="install-dotfiles.sh"
sudo -u $user -H bash $user_script_dir/$tmp_script $dotfiles_repo

# Install atom packages
tmp_script="install-atom-packages.sh"
sudo -u $user -H bash $user_script_dir/$tmp_script

# Disable sudo prompt for pacaur
bash $DIR/root/patch-sudo.sh $user 1

# Install pacaur packages
tmp_script="install-pacaur.sh"
sudo -u $user -H bash $user_script_dir/$tmp_script $password

tmp_script="install-aur-packages.sh"
sudo -u $user -H bash $user_script_dir/$tmp_script

# Enable sudo prompt for pacaur
bash $DIR/root/patch-sudo.sh $user 0
