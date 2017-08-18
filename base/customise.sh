#!/bin/bash

sudo mkdir -p airootfs/etc/skel/github

if [ -d airootfs/etc/skel/github/dotfiles ]; then
  echo "Updating dotfiles repo..."
  git -C airootfs/etc/skel/github/dotfiles pull
else
  echo "Cloning dotfiles repo..."
  git -C airootfs/etc/skel/github/ clone https://github.com/egeldenhuys/dotfiles --depth=1
fi
