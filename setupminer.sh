# Before running:
# sudo apt-get update && sudo apt-get upgrade -y
# sudo apt-get install -y git openssh-server
# sudo vim /etc/sudoers
# Add the line:
# <username> ALL=(ALL) NOPASSWD: ALL

# Add graphics drivers repos
# sudo vim /etc/apt/sources.list
# add line:
# deb http://archive.ubuntu.com/ubuntu/ trusty-proposed restricted main multiverse universe
# sudo vim /etc/apt/preferences.d/proposed-updates
# Add lines:
# Package: *
# Pin: release a=trusty-proposed
# Pin-Priority: 400

# Praise Mike
echo "==============================="
echo "= PRAISE MIKE, GOD OF MINING. ="
echo "==============================="
sleep 5

# Add repositories and setup
apt-get update
apt-get upgrade -y
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
# nohup geth --rpc --etherbase "0x753562eea69cd2d342a9c07edd49b9753dc0f01e" --genesis ~/genesis.json > ~/geth.log &
# nohup sudo ethminer -G -t 4 > ~/ethminer.log &
