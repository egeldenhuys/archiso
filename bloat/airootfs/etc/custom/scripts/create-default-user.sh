#!/bin/bash

groupadd -f sudo
! id arch && useradd -s /usr/bin/zsh -m -G sudo arch
echo -en "password\npassword" | passwd arch
