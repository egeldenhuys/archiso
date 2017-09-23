#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

echo "Linking config files"

# Link configuration files

mkdir -p ~/.config/i3
ln -fs $DIR/config/i3/config ~/.config/i3/config

mkdir -p ~/.config/i3blocks
ln -fs $DIR/config/i3blocks/config ~/.config/i3blocks/config

mkdir -p ~/.config/termite
ln -fs $DIR/config/termite/config ~/.config/termite/config

ln -fs $DIR/gitconfig ~/.gitconfig
ln -fs $DIR/gpg.conf ~/.gpg.conf
ln -fs $DIR/gdbinit ~/.gdbinit
