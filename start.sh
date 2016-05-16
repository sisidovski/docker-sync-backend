#!/bin/sh

echo $VOLUME
echo $BUCKET_NAME
echo $AWS_ACCESS_KEY_ID
echo $AWS_SECRET_ACCESS_KEY

aws s3 sync s3://$BUCKET_NAME/ $VOLUME
echo "*/10 * * * * $(which aws) s3 sync $VOLUME s3://$BUCKET_NAME/" > /var/spool/cron/crontabs/root && crond -l 2 -f
