#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

# Note: Assumes all is being run with root or via sudo

# pre-requisites for cli
apt-get update
apt-get -y install ca-certificates curl apt-transport-https lsb-release gnupg
# install MS key for the repo
curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null
# add the Repo for this Ubuntu release
AZ_REPO=$(lsb_release -cs) && echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | sudo tee /etc/apt/sources.list.d/azure-cli.list
# update and then install Azure-CLI
apt-get update
apt-get -y install azure-cli
