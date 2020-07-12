#!/bin/bash -xe

if [ "$#" -lt 1 ]; then
    echo "usage $0 branch"
    exit 1
fi

BRANCH=$1

S3_APPS_URL=s3://apps.syncloud.org

if [[ "$BRANCH" == "stable" ]] && [[ "$2" != "--force" ]]; then
  echo "not pushing to $BRANCH, use --force"
  exit 1
fi

s3cmd put index-v2 $S3_APPS_URL/releases/$BRANCH/

for f in images/*.png
do
  md5sum $f > $f.md5
done

aws-shell sync images/ $S3_APPS_URL/releases/$BRANCH/images/