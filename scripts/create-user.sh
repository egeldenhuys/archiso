#!/bin/bash

# Creates the default user

defaultUser=arch

! id $defaultUser && useradd -s /usr/bin/zsh -m $defaultUser
echo -en "password\npassword" | passwd $defaultUser
