#!/usr/bin/env bash
docker build .

IMAGE_ID=$(docker images -q --format='{{.ID}}' | head -1)
id=$(docker create $IMAGE_ID)
docker cp $id:/tmp/hello-world/target/armv7-unknown-linux-musleabihf/release/hello-world test_bin
docker rm -v $id

