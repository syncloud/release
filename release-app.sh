#!/bin/bash -xe

if [ "$#" -lt 3 ]; then
    echo "usage $0 branch app version"
    exit 1
fi

SAM=/opt/app/sam/bin/sam
if [ ! -f $SAM ]; then
    echo "install sam by running ./install-sam.sh"
    exit 1
fi

BRANCH=$1
APP=$2
VERSION=$3

$SAM --debug $BRANCH $BRANCH --override $APP=$VERSION
