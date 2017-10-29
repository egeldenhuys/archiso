#!/bin/bash

# create-user.sh <username> <password> <sudo [0|1]>
# create-user.sh $1 $2 $3
# Create a new user if it does not yet exist

! id $1 && useradd -s /usr/bin/zsh -m $1
echo -en "$2\n$2" | passwd $1

if [ $3 = 1 ]; then
  groupadd -f sudo
  usermod -aG sudo $1
fi
