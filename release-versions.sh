#!/bin/bash -xe

if [ "$#" -lt 2 ]; then
    echo "usage $0 from to"
    exit 1
fi

SAM=/opt/app/sam/bin/sam
if [ ! -f $SAM ]; then
    echo "install sam by running ./install-sam.sh"
    exit 1
fi

FROM=$1
TO=$2

$SAM --debug release --versions $FROM $TO