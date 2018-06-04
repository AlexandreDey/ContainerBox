#!/bin/bash

current_user=$USER

# Copying wrapper
sudo cp ./bin/ContainerBox /usr/bin/
sudo chmod 755 /usr/bin/ContainerBox

# Creating config dir
sudo mkdir -p /etc/ContainerBox/
sudo cp -R ./etc/creator /etc/ContainerBox/
sudo cp -R ./etc/host /etc/ContainerBox/
sudo cp -R ./etc/helpers /etc/ContainerBox/
sudo chmod 755 -R /etc/ContainerBox/


# Add current user to the container box group
sudo groupadd containerbox
sudo usermod -a -G containerbox $current_user

sudo bash -c "echo '%containerbox ALL=NOPASSWD: /etc/ContainerBox/helpers/passthrough' >> /etc/sudoers"