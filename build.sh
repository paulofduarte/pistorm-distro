#!/bin/sh

YOCTO_BRANCH=${YOCTO_BRANCH:-dunfell}

if [ ! -d poky ]; then
    git clone -b $YOCTO_BRANCH git://git.yoctoproject.org/poky.git
else 
    cd poky
    git checkout $YOCTO_BRANCH
    git pull
    cd ..
fi

cd poky

if [ ! -d meta-openembedded ]; then
   git clone -b $YOCTO_BRANCH git://git.openembedded.org/meta-openembedded
else
    cd meta-openembedded
    git checkout $YOCTO_BRANCH
    git pull
    cd ..
fi

if [ ! -d meta-qt5 ]; then
   git clone -b $YOCTO_BRANCH https://github.com/meta-qt5/meta-qt5
else
    cd meta-qt5
    git checkout $YOCTO_BRANCH
    git pull
    cd ..
fi

if [ ! -d meta-raspberrypi ]; then
   git clone -b $YOCTO_BRANCH git://git.yoctoproject.org/meta-raspberrypi
else
    cd meta-raspberrypi
    git checkout $YOCTO_BRANCH
    git pull
    cd ..
fi

if [ ! -d meta-security ]; then
   git clone -b $YOCTO_BRANCH git://git.yoctoproject.org/meta-security.git
else
    cd meta-security
    git checkout $YOCTO_BRANCH
    git pull
    cd ..
fi

if [ ! -d meta-rpi ]; then
    git clone -b $YOCTO_BRANCH git://github.com/jumpnow/meta-rpi
else
    cd meta-rpi
    git checkout $YOCTO_BRANCH
    git pull
    cd ..
fi

cd ..

mkdir -p build/conf
cp config/local.conf build/conf
cp config/bblayers.conf build/conf

source poky/oe-init-build-env build

bitbake console-image