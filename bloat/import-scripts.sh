#!/bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

rm -fr $DIR/airootfs/scripts
mkdir -p $DIR/airootfs/scripts

cp -fr $DIR/../scripts $DIR/airootfs/