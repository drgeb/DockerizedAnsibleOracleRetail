#!/bin/sh
export TEMP_BUILD_IMAGE_NAME=store_oraclepos_cashregister
export BUILD_IMAGE_NAME=${PWD##*/}

docker-compose run --rm ansible_playbook install.yml -i inventory
docker-compose stop
docker commit ${TEMP_BUILD_IMAGE_NAME} drgeb/${BUILD_IMAGE_NAME}:latest
docker-compose rm
