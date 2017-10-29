#!/bin/bash

# Copy a directory set permissions to the user

# bootstrap-script.sh <user> <src> <dst>

cp -avfr $2 $3
chown -R $1 $3
chgrp -R $1 $3
chmod -R 755 $3
