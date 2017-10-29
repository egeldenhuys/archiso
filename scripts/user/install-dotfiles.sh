#!/bin/bash

# install-dotfiles.sh <repo>

if [ -d ~/dotfiles ]; then
  echo "Updating dotfiles repo..."
  git -C ~/dotfiles pull
else
  echo "Cloning dotfiles repo..."
  git -C ~ clone $1 --depth=1
fi

bash ~/dotfiles/link.sh
