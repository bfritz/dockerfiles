#!/bin/bash

CONTAINER_ID=$(docker run -d -P -t android-dev)
PORT=$(docker port $CONTAINER_ID 22 | awk -F: '{print $2}')

echo "Container: $CONTAINER_ID"
echo "Attach with:"
echo
echo "  xpra attach ssh/dev@localhost:$PORT/100"
echo
echo "Run Android IDE with:"
echo
echo "  android-studio"
echo

# display username and password
sleep 5
docker logs $CONTAINER_ID 2>&1 | head -n1
