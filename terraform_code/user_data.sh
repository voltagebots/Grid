#!/bin/bash

sudo groupadd looker && sudo useradd -m -g looker looker
sudo su - looker
mkdir ~/.ssh
chmod 700 ~/.ssh && cd ~/.ssh
touch authorized_keys
chmod 600 authorized_keys