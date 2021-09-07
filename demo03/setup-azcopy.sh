#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

# Note: Assumes all is being run with root or via sudo

# pre-requisites for cli
apt-get update
apt-get -y install wget

# download azcopy
wget https://aka.ms/downloadazcopy-v10-linux

# expand
umask 0002
tar -xf downloadazcopy-v10-linux

# remove any existing
rm -f /usr/bin/azcopy || true

# move into place
cp ./azcopy_linux_amd64_*/azcopy /usr/bin/
chmod 755 /usr/bin/azcopy
