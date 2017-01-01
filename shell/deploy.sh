#!/bin/bash
GIT_DIR=/home/USER/app
SRC_DIR=/home/USER/app-src
IMAGE_NAME=user/some-name
CONTAINER_NAME=some-name

#clear source directory
if [ -d "$SRC_DIR" ];
then
  rm -R -f "$SRC_DIR"
fi
mkdir "$SRC_DIR"

#checkout app source
git --work-tree="$SRC_DIR" --git-dir="$GIT_DIR" checkout -f

#remove existing docker container and image
docker rm -f "$CONTAINER_NAME"
docker rmi -f "$IMAGE_NAME"

#build and run app
docker build -t "$IMAGE_NAME" "$SRC_DIR"
docker run -p 80:3000 -d --name "$CONTAINER_NAME" "$IMAGE_NAME"
