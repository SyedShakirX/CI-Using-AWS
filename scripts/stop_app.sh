#!/bin/bash
set -e

# Get IDs of all running containers
contIDs=$(docker ps -q)

if [ -n "$contIDs" ]; then
  docker rm -f $contIDs
else
  echo "No running containers to remove."
fi
