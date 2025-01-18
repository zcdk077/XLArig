#!/bin/bash

N=$(echo -en '\033[0m')
RD=$(echo -en '\033[07;31m') # tulisan diberi blok
RED=$(echo -en '\033[00;31m')
GR=$(echo -en '\033[07;32m') # tulisan diberi blok
GRN=$(echo -en '\033[00;32m')
YLW=$(echo -en '\033[00;33m')
BLUE=$(echo -en '\033[00;34m')
MTA=$(echo -en '\033[00;35m')
LMA=$(echo -en '\033[20;36m')
PURP=$(echo -en '\033[00;35m')
CYAN=$(echo -en '\033[00;36m')
LGRAY=$(echo -en '\033[00;38m')
LRD=$(echo -en '\033[07;31m')
LRED=$(echo -en '\033[01;31m')
LGR=$(echo -en '\033[01;32m')
LYL=$(echo -en '\033[01;33m')
LYLO=$(echo -en '\033[07;33m') # tulisan diberi blok
LBL=$(echo -en '\033[01;34m')
LBLU=$(echo -en '\033[07;34m')
LMA=$(echo -en '\033[01;35m')
LPPLE=$(echo -en '\033[01;35m')
LCY=$(echo -en '\033[01;36m')
LCYN=$(echo -en '\033[07;36m')
WHT=$(echo -en '\033[01;37m')

echo "${GR}Berhasil download build${N}"
sleep 3

set -e
echo "${LYLO}Tunggu sebentar${N}"
sleep 2
echo "${LYLO}Kita install library terlebih dahulu${N}"
sleep 3
pkg install git nano build-essential cmake automake libtool autoconf -y
echo "${LYLO}Cloning XLArig${N}"
sleep 5
git clone https://github.com/scala-network/XLArig.git
mkdir XLArig/build
cd XLArig/build
# cmake
echo "${LYLO}Proses CMake${N}"
sleep 5
if ! cmake -DWITH_HWLOC=OFF ..; then
    echo "${RD}Error: CMake configuration failed${N}"
    exit 1
else
    cmake -DWITH_HWLOC=OFF ..
fi
# compile
echo "${LYLO}Compiling now${N}"
sleep 5
if ! make -j$(nproc); then
    echo "${RD}Error: Compiling failed${N}"
    exit 1
else
    make -j$(nproc) && echo "${GR}Proses Instalasi selesai${N}"
fi
sleep 3
echo "${LYLO}Proses clone konfigurasi${N}"
sleep 3
cd
cd xmrig
wget https://raw.githubusercontent.com/zcdk077/master/start.sh
chmod +x start.sh
wget https://raw.githubusercontent.com/zcdk077/master/config.json
chmod +x config.json
cd
echo "${GR}Berhasil cloning konfigurasi${N}"
sleep 3
