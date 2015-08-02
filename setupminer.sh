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
sudo add-apt-repository -y ppa:ethereum/ethereum
sudo add-apt-repository -y ppa:ethereum/ethereum-qt
sudo apt-get -y install language-pack-en-base
sudo dpkg-reconfigure locales
sudo apt-get -y install software-properties-common
wget -O - http://llvm.org/apt/llvm-snapshot.gpg.key | sudo apt-key add -
sudo add-apt-repository "deb http://llvm.org/apt/trusty/ llvm-toolchain-trusty main"
sudo apt-get update
sudo apt-get upgrade -y

# Build Geth
sudo apt-get install -y ethereum libgmp3-dev golang
mkdir -p ~/go; echo "export GOPATH=$HOME/go" >> ~/.bashrc
echo "export PATH=$PATH:$HOME/go/bin:/usr/local/go/bin" >> ~/.bashrc
source ~/.bashrc
git clone https://github.com/ethereum/go-ethereum
cd go-ethereum; git checkout master; sudo make geth; cd ~

# Build Eth
sudo apt-get -y install build-essential git cmake libboost-all-dev libgmp-dev libleveldb-dev libminiupnpc-dev libreadline-dev libncurses5-dev libcurl4-openssl-dev libcryptopp-dev libjson-rpc-cpp-dev libmicrohttpd-dev libjsoncpp-dev libargtable2-dev llvm-3.8-dev libedit-dev mesa-common-dev ocl-icd-libopencl1 opencl-headers libgoogle-perftools-dev qtbase5-dev qt5-default qtdeclarative5-dev libqt5webkit5-dev libqt5webengine5-dev ocl-icd-dev libv8-dev
git clone https://github.com/ethereum/cpp-ethereum
cd cpp-ethereum; git checkout master
mkdir build; cd build; sudo cmake .. -DGUI=0 -DETHASHCL=1; sudo make -j $(nproc)

# Install graphics drivers
sudo apt-get install -y ubuntu-drivers-common
sudo apt-get install -y fglrx-updates

# Get genesis
curl blockapps.net/genesis_block.json > ~/genesis.json

# Reboot
sudo apt-get update && sudo apt-get upgrade -y
sudo reboot

# Run
# cd ~/go-ethereum/build/bin/
# nohup ./geth --rpc --etherbase "0x753562eea69cd2d342a9c07edd49b9753dc0f01e" --genesis ~/genesis.json > ~/geth.log &
# cd ~/cpp-ethereum/build/ethminer
# nohup sudo ./ethminer -G -t 4 > ~/ethminer.log &
