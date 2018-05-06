#!/bin/bash

# Copying wrapper
sudo cp ./bin/ContainerBox /usr/bin/
sudo chmod 755 /usr/bin/ContainerBox

# Creating config dir
sudo mkdir -p /etc/ContainerBox/
sudo cp -R ./etc/creator /etc/ContainerBox/
sudo cp -R ./etc/host /etc/ContainerBox/
sudo chmod 755 -R /etc/ContainerBox/
