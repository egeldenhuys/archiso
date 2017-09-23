#!/bin/bash
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

destFile=$HOME/.bashrc
yubiFile=$DIR/enable-gpg-ssh.sh

if grep -q "FLAG: gpg-agent-enabled" $destFile; then
    echo "gpg-agent has already been enabled"
else
    echo -e "\n# FLAG: gpg-agent-enabled" >> $destFile
    echo "source $yubiFile" >> $destFile
    echo "gpg-agent has been enabled for SSH"
fi

if [ -e $HOME/.zshrc ]; then
  destFile=$HOME/.zshrc
fi

if grep -q "FLAG: gpg-agent-enabled" $destFile; then
    echo "gpg-agent has already been enabled"
else
    echo -e "\n# FLAG: gpg-agent-enabled" >> $destFile
    echo "source $yubiFile" >> $destFile
    echo "gpg-agent has been enabled for SSH"
fi
