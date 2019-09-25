#!/bin/bash

echo "Updating sources..."
sudo -E apt-get -qq update > /dev/null

echo "Installing core components..."
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg-agent software-properties-common || exit $?

echo "Set up repo keys..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - > /dev/null
curl -fsSL https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | sudo apt-key add - > /dev/null

echo "Add repos to sources list..."
sudo add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb
sudo add-apt-repository --yes https://download.docker.com/linux/ubuntu

echo "Refresh package list..."
sudo apt-get update > /dev/null

echo "Installing Java..."
sudo apt-get install -y adoptopenjdk-8-hotspot adoptopenjdk-11-hotspot adoptopenjdk-12-hotspot adoptopenjdk-13-hotspot || exit $?

echo "Installing Git..."
sudo -E apt-get install -y git  || exit $?

echo "Installing gradle & maven..."
sudo -E apt-get install -y gradle maven || exit $?

echo "Installing docker..."
sudo -E apt-get -qq update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io || exit $?

echo "Installing Unzip..."
sudo apt-get install -y unzip || exit $?

echo "Installing Ansible..."
sudo apt-get install -y ansible || exit $?