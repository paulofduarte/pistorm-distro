#!/bin/sh

export BUILDROOT_VERSION=${BUILDROOT_VERSION:-2021.02.1}

if [ ! -d buildroot-${BUILDROOT_VERSION} ]; then
    curl -O https://buildroot.org/downloads/buildroot-${BUILDROOT_VERSION}.tar.bz2
    tar jxf buildroot-${BUILDROOT_VERSION}.tar.bz2
    rm buildroot-${BUILDROOT_VERSION}.tar.bz2
fi

find resources -name "*.sh" -exec chmod 755 {} \;
cp -pav resources/. buildroot-${BUILDROOT_VERSION}/

cd buildroot-${BUILDROOT_VERSION}

make pistorm-raspberrypi3_defconfig