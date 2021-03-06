#!/bin/bash

TAG=android-dev-maxs
CONTAINER_ID=$(docker run -d -P -t android-dev-maxs)
PORT=$(docker port $CONTAINER_ID 22 | awk -F: '{print $2}')

echo "Container: $CONTAINER_ID"
echo "Attach with:"
echo
echo "  xpra attach ssh/dev@localhost:$PORT/100"
echo

# display username and password
sleep 5
docker logs $CONTAINER_ID 2>&1 | head -n1
