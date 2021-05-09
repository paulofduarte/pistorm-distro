################################################################################
#
# pistorm
#
################################################################################

PISTORM_VERSION = $(PISTORM_BRANCH)
PISTORM_SITE = git://github.com/captain-amygdala/pistorm
PISTORM_LICENSE = MIT
PISTORM_LICENSE_FILES = LICENSE
PISTORM_CFLAGS = -I. $(TARGET_CFLAGS) -O3 -D_FILE_OFFSET_BITS=64 \
	-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
PISTORM_LFLAGS=`$(STAGING_DIR)/usr/bin/sdl2-config --libs`

define PISTORM_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(PISTORM_CFLAGS)" \
		LFLAGS="$(PISTORM_LFLAGS)" -C $(@D)
endef

define PISTORM_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0644 $(@D)/default.cfg $(TARGET_DIR)/opt/pistorm
	$(INSTALL) -D -m 0755 $(@D)/emulator $(TARGET_DIR)/opt/pistorm
	$(INSTALL) -D -m 0644 $(@D)/nprog.sh $(TARGET_DIR)/opt/pistorm
	$(INSTALL) -D -m 0644 $(@D)/nprog_240.sh $(TARGET_DIR)/opt/pistorm
	$(INSTALL) -D -m 0644 $(@D)/nprog_old.sh $(TARGET_DIR)/opt/pistorm
	$(INSTALL) -D -m 0644 $(@D)/x86k.cfg $(TARGET_DIR)/opt/pistorm
	$(INSTALL) -D -m 0644 $(@D)/nprog/68_240.cfg $(TARGET_DIR)/opt/pistorm/nprog
	$(INSTALL) -D -m 0644 $(@D)/nprog/68new.cfg $(TARGET_DIR)/opt/pistorm/nprog
	$(INSTALL) -D -m 0644 $(@D)/nprog/68old.cfg $(TARGET_DIR)/opt/pistorm/nprog
	$(INSTALL) -D -m 0644 $(@D)/rtl/EPM240_bitstream.svf $(TARGET_DIR)/opt/pistorm/rtl
	$(INSTALL) -D -m 0644 $(@D)/rtl/bitstream.svf $(TARGET_DIR)/opt/pistorm/rtl
endef

$(eval $(generic-package))
