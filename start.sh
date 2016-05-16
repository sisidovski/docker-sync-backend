#!/bin/sh

if [ -z $BUCKET_NAME ]; then
  echo "BUCKET_NAME environment required."
  exit 1
fi
if [ -z $VOLUME ]; then
  echo "VOLUME environment required."
  exit 1
fi
if [ -z $AWS_ACCESS_KEY_ID ]; then
  echo "AWS_ACCESS_KEY_ID environment required."
  exit 1
fi
if [ -z $AWS_SECRET_ACCESS_KEY ]; then
  echo "AWS_SECRET_ACCESS_KEY environment required."
  exit 1
fi

aws s3 sync s3://$BUCKET_NAME/ $VOLUME
echo "*/10 * * * * $(which aws) s3 sync $VOLUME s3://$BUCKET_NAME/ && echo \"synced: `date`\"" > /var/spool/cron/crontabs/root && crond -l 2 -f
