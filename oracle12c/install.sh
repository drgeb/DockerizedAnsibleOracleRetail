#!/bin/sh
export TEMP_BUILD_IMAGE_NAME=ansible_target
export BUILD_IMAGE_NAME=${PWD##*/}

docker-compose run --rm test install.yml -i inventory
docker stop ${TEMP_BUILD_IMAGE_NAME} 
docker commit ${TEMP_BUILD_IMAGE_NAME} drgeb/${BUILD_IMAGE_NAME}:latest
docker rm ${TEMP_BUILD_IMAGE_NAME}

