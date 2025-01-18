#!/bin/bash

echo "Berhasil download build"
sleep 3

set -e
echo "Tunggu sebentar"
sleep 3
echo "Kita update dan install library terlebih dahulu"
sleep 5
pkg update && pkg upgrade -y
pkg install wget nano build-essential cmake automake libtool autoconf
echo "Cloning XLArig"
sleep 5
git clone https://github.com/scala-network/XLArig.git
mkdir XLArig/build
cd XLArig/build
# cmake
echo "Proses CMake"
sleep 5
if ! cmake -DWITH_HWLOC=OFF ..; then
    echo "Error: CMake configuration failed"
    exit 1
else
    cmake -DWITH_HWLOC=OFF ..
fi
# compile
echo "Compiling now"
sleep 5
if ! make -j$(nproc); then
    echo "Error: Compiling failed"
    exit 1
else
    make -j$(nproc) && echo "Proses Instalasi selesai"
fi
sleep 3
echo "Proses clone konfigurasi"
sleep 1
echo "Proses clone konfigurasi ."
sleep 1
echo "Proses clone konfigurasi . ."
sleep 1
echo "Proses clone konfigurasi . . ."
sleep 3
cd
cd XLArig
wget https://raw.githubusercontent.com/zcdk077/XLArig-termux/master/start.sh
chmod +x start.sh
wget https://raw.githubusercontent.com/zcdk077/XLArig-termux/master/config.json
chmod +x config.json
echo "Berhasil cloning konfigurasi"
cd
