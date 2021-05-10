#!/bin/sh

export BUILDROOT_VERSION=${BUILDROOT_VERSION:-2021.02.1}

sh ./setup.sh

cd buildroot-${BUILDROOT_VERSION}

make menuconfig
cp .config ../resources/configs/pistorm-raspberrypi3_defconfig