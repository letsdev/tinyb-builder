#!/usr/bin/env bash

set -euo pipefail

docker build -t tinyb-builder .

if [ -d lib ]; then
    echo "Removing existing output directory.."
    rm -rf lib
fi
mkdir lib

readonly CONTAINER_ID=$(docker create --rm -v lib:/opt/tinyb-out/lib64 tinyb-builder)

echo "Created container with id ${CONTAINER_ID}"

docker cp ${CONTAINER_ID}:/opt/tinyb-out/lib64 lib
docker rm ${CONTAINER_ID}

