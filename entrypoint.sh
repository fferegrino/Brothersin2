#!/bin/bash

wget -q $WORLD_URL -O world.zip

unzip world.zip && rm world.zip

# Store the name of the single folder in a variable
folder_name=$(ls -d */ | head -n 1)

unmined-cli web render --world $folder_name --output /rendered/ --zoomin=4