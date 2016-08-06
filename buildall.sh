#!/bin/sh
cd ansible_playbook
./build.sh
cd ..

cd ansible_target
./build.sh
cd ..

cd oracle12c
./install.sh
cd ..

cd mq-docker
./build.sh
cd ..

cd storeserver
./install.sh
cd ..

cd cashregister
./install.sh
cd ..


