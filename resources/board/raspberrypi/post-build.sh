#!/bin/sh

set -u
set -e

# Add a console on tty1
if [ -e ${TARGET_DIR}/etc/inittab ]; then
    grep -qE '^tty1::' ${TARGET_DIR}/etc/inittab || \
	sed -i '/GENERIC_SERIAL/a\
tty1::respawn:/sbin/getty -L  tty1 0 vt100 # HDMI console' ${TARGET_DIR}/etc/inittab
fi

cp package/busybox/S10mdev ${TARGET_DIR}/etc/init.d/S10mdev
chmod 755 ${TARGET_DIR}/etc/init.d/S10mdev
cp package/busybox/mdev.conf ${TARGET_DIR}/etc/mdev.conf
cp board/raspberrypi3/interfaces ${TARGET_DIR}/etc/network/interfaces
cp board/raspberrypi3/wpa_supplicant.conf ${TARGET_DIR}/etc/wpa_supplicant.conf
rm -rf ${TARGET_DIR}/opt/pistorm
mkdir  ${TARGET_DIR}/opt/pistorm
cp -pav pistorm/deploy/* ${TARGET_DIR}/opt/pistorm

rm -rf ${TARGET_DIR}/etc/init.d/disabled
mkdir ${TARGET_DIR}/etc/init.d/disabled
rm -rf ${TARGET_DIR}/var/lib/nfs/v4recovery
mkdir -p ${TARGET_DIR}/var/lib/nfs/v4recovery

touch ${TARGET_DIR}/FIRSTBOOT

cp -pav custom/S01pistorm ${TARGET_DIR}/etc/init.d/
cp -pav custom/S99pistorm ${TARGET_DIR}/etc/init.d/
cp -pav custom/S90Secondboot ${TARGET_DIR}/etc/init.d/
