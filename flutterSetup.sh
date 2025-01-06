#!/bin/bash

sudo apt-get update -y && sudo apt-get upgrade -y;
sudo apt-get install -y curl git unzip xz-utils zip libglu1-mesa
sudo apt-get install libc6:amd64 libstdc++6:amd64 lib32z1 libbz2-1.0:amd64

# you have to add the latest file link of the below address. I will use it
cd
mkdir programs
cd programs/
# https://docs.flutter.dev/get-started/install/linux/android
wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.27.1-stable.tar.xz
tar xf flutter_linux*.tar.xz
#rm flutter_linux*.tar.xz
echo "export PATH=\"\$PATH:`pwd`/flutter/bin\"" >> ~/.bashrc
source ~/.bashrc
