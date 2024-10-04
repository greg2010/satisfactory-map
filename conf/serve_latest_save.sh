#!/bin/sh

LATEST_SAVE=$(ls -t $SAVE_FILE_DIRECTORY | head -n1)
LATEST_SAVE_PATH="$SAVE_FILE_DIRECTORY/$LATEST_SAVE"

SAVE_SIZE=$(stat -c%s $LATEST_SAVE_PATH)

echo "HTTP/1.1 200 OK"
echo "Content-Type: application/octet-stream"
echo "Content-Length: $SAVE_SIZE"
echo
cat $LATEST_SAVE_PATH