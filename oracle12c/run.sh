#!/bin/sh
export BUILD_IMAGE_NAME=${PWD##*/}

docker run -h ca73edac25f4 -d --name ${BUILD_IMAGE_NAME} drgeb/${BUILD_IMAGE_NAME} $*
