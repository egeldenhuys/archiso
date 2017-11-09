#!/bin/bash

repo_url="https://github.com/egeldenhuys/aui"

if [ -d ~/aui ]; then
  echo "Updating aui repo..."
  git -C ~/aui pull
else
  echo "Cloning aui repo..."
  git -C ~ clone $repo_url --depth=1
fi
