#!/bin/sh

BUILDROOT_VERSION=${1:-2021.02.1}

if [ ! -d buildroot-$BUILDROOT_VERSION ]; then
    curl -O https://buildroot.org/downloads/buildroot-$BUILDROOT_VERSION.tar.bz2
    tar jxf buildroot-$BUILDROOT_VERSION.tar.bz2
    rm buildroot-$BUILDROOT_VERSION.tar.bz2
fi

cp pistorm_distro.config buildroot-$BUILDROOT_VERSION/.config
cp pistorm_logo.png buildroot-$BUILDROOT_VERSION/
cd buildroot-$BUILDROOT_VERSION
make