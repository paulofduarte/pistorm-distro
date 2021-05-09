################################################################################
#
# pistorm
#
################################################################################

PISTORM_VERSION = $(PISTORM_BRANCH)
PISTORM_SITE = git://github.com/captain-amygdala/pistorm
PISTORM_LICENSE = MIT
PISTORM_LICENSE_FILES = LICENSE
PISTORM_DEPENDENCIES = sdl2
PISTORM_CFLAGS = -I. $(TARGET_CFLAGS) -O3 -D_FILE_OFFSET_BITS=64 \
	-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
PISTORM_LFLAGS=`$(STAGING_DIR)/usr/bin/sdl2-config --libs`

define PISTORM_BUILD_CMDS
	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) m68kops.h m68kops.c
	$(MAKE) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(PISTORM_CFLAGS)" \
		LFLAGS="$(PISTORM_LFLAGS)" -C $(@D)
endef

define PISTORM_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0644 $(@D)/default.cfg $(TARGET_DIR)/opt/pistorm/default.cfg
	$(INSTALL) -D -m 0755 $(@D)/emulator $(TARGET_DIR)/opt/pistorm/emulator
	$(INSTALL) -D -m 0644 $(@D)/nprog.sh $(TARGET_DIR)/opt/pistorm/nprog.sh
	$(INSTALL) -D -m 0644 $(@D)/nprog_240.sh $(TARGET_DIR)/opt/pistorm/nprog_240.sh
	$(INSTALL) -D -m 0644 $(@D)/nprog_old.sh $(TARGET_DIR)/opt/pistorm/nprog_old.sh
	$(INSTALL) -D -m 0644 $(@D)/test.cfg $(TARGET_DIR)/opt/pistorm/test.cfg
	$(INSTALL) -D -m 0644 $(@D)/x68k.cfg $(TARGET_DIR)/opt/pistorm/x68k.cfg
	$(INSTALL) -D -m 0644 $(@D)/nprog/68_240.cfg $(TARGET_DIR)/opt/pistorm/nprog/68_240.cfg
	$(INSTALL) -D -m 0644 $(@D)/nprog/68new.cfg $(TARGET_DIR)/opt/pistorm/nprog/68new.cfg
	$(INSTALL) -D -m 0644 $(@D)/nprog/68old.cfg $(TARGET_DIR)/opt/pistorm/nprog/68old.cfg
	$(INSTALL) -D -m 0644 $(@D)/rtl/EPM240_bitstream.svf $(TARGET_DIR)/opt/pistorm/rtl/EPM240_bitstream.svf
	$(INSTALL) -D -m 0644 $(@D)/rtl/bitstream.svf $(TARGET_DIR)/opt/pistorm/rtl/bitstream.svf
endef

$(eval $(generic-package))
