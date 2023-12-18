#!/bin/bash
apt update
apt install -y gcc-aarch64-linux-gnu swig python3-pyelftools make gcc cpp libncurses-dev libssl-dev
apt install -y git fakeroot libncurses-dev zstd dracut bc flex bison dwarves
make mrproper
cp --recursive rkbin /tmp 
export ROCKCHIP_TPL=/tmp/rkbin/rk35/rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.12.bin
export BL31=/tmp/rkbin/rk35/rk3588_bl31_v1.40.elf
make CROSS_COMPILE=aarch64-linux-gnu- orangepi-5-plus-rk3588_defconfig
make CROSS_COMPILE=aarch64-linux-gnu- --jobs="$(nproc)" all
rm --recursive --force /tmp/rkbin
