#!/bin/bash

if [ -z "$WORLD_URL" ]; then
  echo "WORLD_URL is not set. Checking in /world/ for a world.zip file."

    if [ -f /world/world.zip ]; then
        echo "Found world.zip in /world/."
        cp /world/world.zip .
    else
        echo "No WORLD_URL set and no world.zip found in /world/. Exiting."
        exit 1
    fi
else
    wget -q $WORLD_URL -O world.zip
fi

unzip world.zip && rm world.zip

# Store the name of the single folder in a variable
folder_name=$(ls -d */ | head -n 1)

unmined-cli web render --world $folder_name --output /rendered/ --zoomin=4

cp /rendered/unmined.index.html /rendered/index.html
