#!/bin/bash -xe

if [ "$#" -lt 3 ]; then
    echo "usage $0 branch version"
    exit 1
fi

BRANCH=$1
APP=snapd
VERSION=$3
S3_APPS_URL=s3://apps.syncloud.org

printf ${VERSION} > ${APP}.version
aws s3 cp ${APP}.version ${S3_APPS_URL}/releases/${BRANCH}/
