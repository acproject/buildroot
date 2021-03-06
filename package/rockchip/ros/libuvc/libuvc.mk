LIBUVC_VERSION = v0.0.5
LIBUVC_SITE = https://github.com/ktossell/libuvc/archive
LIBUVC_SOURCE = $(LIBUVC_VERSION).tar.gz

LIBUVC_DEPENDENCIES = boost jpeg cv-bridge libusb

LIBUVC_CONF_OPTS += \
	-DSTAGING_DIR="$(STAGING_DIR)"

define LIBUVC_FIX_CMAKE_IN
	$(SED) 's#"@CONF#"@STAGING_DIR@@CONF#' \
		$(@D)/libuvcConfig.cmake.in
endef
LIBUVC_POST_PATCH_HOOKS += LIBUVC_FIX_CMAKE_IN

$(eval $(catkin-package))
