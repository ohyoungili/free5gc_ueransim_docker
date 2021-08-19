#!/bin/bash
#git clone https://github.com/PrinzOwO/gtp5g.git
#cd gtp5g
#make clean && make
#sudo make install

# As noted above, the GTP kernel module used by the UPF requires that you use Linux kernel version 5.0.0-23-generic. To verify your version:
#uname -r
# 5.8.0-63-generic 

git clone -b v0.2.1 https://github.com/free5gc/gtp5g.git
cd gtp5g
make
sudo make install
