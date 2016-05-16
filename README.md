# docker-sync-backend

docker-sync-backend makes local dir sync to backend (Amazon S3).
First, fetc data from backend on startup, and then sync local dir to backend regularly (task runs per 10 minutes).

## Required envaironment variables

- `$AWS_ACCESS_KEY_ID`
- `$AWS_SECRET_ACCESS_KEY`
- `$BUCKET_NAME`
 - S3 bucket name.
- `$VOLUME`
 - A directory path that is synchronized to Amazon S3. It is supporsed to use with data volume.
