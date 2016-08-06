#!/bin/sh
export TEMP_BUILD_IMAGE_NAME=ansible_target
export BUILD_IMAGE_NAME=${PWD##*/}

docker-compose run --rm test install.yml -i inventory
echo "**********************************************************************"
docker ps -a
echo "**********************************************************************"
docker exec -ti ${TEMP_BUILD_IMAGE_NAME}· "rm -rf /tmp/*"
echo "**********************************************************************"
docker stop ${TEMP_BUILD_IMAGE_NAME} 
echo "**********************************************************************"
docker commit ${TEMP_BUILD_IMAGE_NAME} drgeb/${BUILD_IMAGE_NAME}:latest
echo "**********************************************************************"
docker rm ${TEMP_BUILD_IMAGE_NAME}

