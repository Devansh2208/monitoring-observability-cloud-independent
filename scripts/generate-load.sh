#!/bin/bash

URL=${1:-http://localhost:8000}

echo "======================================="
echo "Generating Traffic"
echo "Target: $URL"
echo "Press CTRL+C to stop"
echo "======================================="

while true
do
    curl -s "$URL" > /dev/null
    sleep 0.5
done