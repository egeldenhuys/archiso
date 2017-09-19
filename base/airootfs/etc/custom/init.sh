#!/bin/bash

bash /etc/custom/common.sh

git -C ~ clone https://github.com/egeldenhuys/dotfiles --depth=1
source ~/dotfiles/init.sh
