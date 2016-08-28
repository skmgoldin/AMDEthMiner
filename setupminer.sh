#!/bin/bash
# RUN AS SUDO

# Praise Mike
echo "==============================="
echo "= PRAISE MIKE, GOD OF MINING. ="
echo "==============================="
sleep 5

# Add graphics drivers repos
echo "deb http://archive.ubuntu.com/ubuntu/ trusty-proposed restricted main multiverse universe" >> /etc/apt/sources.list
echo "Package: *" >> /etc/apt/preferences.d/proposed-updates 
echo "Pin: release a=trusty-proposed" >> /etc/apt/preferences.d/proposed-updates 
echo "Pin-Priority: 400" >> /etc/apt/preferences.d/proposed-updates 

# Add repositories and setup
apt-get update && apt-get upgrade -y
add-apt-repository -y ppa:ethereum/ethereum
add-apt-repository -y ppa:ethereum/ethereum-qt
apt-get update
apt-get install ethereum -y
apt-get install cpp-ethereum -y

# Install graphics drivers
apt-get install -y ubuntu-drivers-common
apt-get install -y fglrx-updates

# Reboot
apt-get update && sudo apt-get upgrade -y
reboot

# Run
# nohup geth --rpc --etherbase "0xf47dF035c49e57DE2Ec27E32f0562BDeB4606ff7" > ~/geth.log &
# sudo nohup ethminer -G -t 4 > ~/ethminer.log &
