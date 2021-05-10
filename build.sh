#!/bin/sh

export PISTORM_BRANCH=${PISTORM_BRANCH:-main}
export BUILDROOT_VERSION=${BUILDROOT_VERSION:-2021.02.1}

sh ./setup.sh

cd buildroot-${BUILDROOT_VERSION}

rm -rf dl/pistorm
rm -rf output/build/pistorm-${PISTORM_BRANCH}
rm -rf output/target/opt/pistorm

make pistorm-rebuild
make

mkdir -p ../release
zip -9j ../release/pistorm-distro-${PISTORM_BRANCH}-$(date +%Y%m%d-%H%M%S).zip output/images/sdcard.img