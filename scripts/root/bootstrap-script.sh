#!/bin/bash

# Copy a script to the user home and set permissions

# bootstrap-script.sh <user> <src> <dst>

cp -f $2 $3
chown $1 $3
chgrp $1 $3
chmod 755 $3
