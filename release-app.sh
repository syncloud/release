#!/bin/bash -xe

if [ "$#" -lt 3 ]; then
    echo "usage $0 branch app version"
    exit 1
fi

if [ -z "$AWS_ACCESS_KEY_ID" ] || [ -z "$AWS_SECRET_ACCESS_KEY" ]; then
  echo "AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY must be set, not updatingg"
  exit 0
fi

BRANCH=$1
APP=$2
VERSION=$3
S3_APPS_URL=s3://apps.syncloud.org

printf ${VERSION} > ${APP}.version
s3cmd put ${APP}.version ${S3_APPS_URL}/releases/${BRANCH}/