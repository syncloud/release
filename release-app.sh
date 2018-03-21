#!/bin/bash -xe

if [ "$#" -lt 3 ]; then
    echo "usage $0 branch app version"
    exit 1
fi

if [ -z "$AWS_ACCESS_KEY_ID" ] || [ -z "$AWS_SECRET_ACCESS_KEY" ]; then
  echo "AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY must be set, not updatingg"
  exit 0
fi

SAM=/opt/app/sam/bin/sam
if [ ! -f $SAM ]; then
    echo "install sam by running ./install-sam.sh"
    exit 1
fi

BRANCH=$1
APP=$2
VERSION=$3

$SAM --debug release $BRANCH $BRANCH --versions --override $APP=$VERSION
