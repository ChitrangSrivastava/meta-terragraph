# A class to install extra Linux kernel header files
inherit kernel-extra-headers-base

# User of this class can put header files in LINUX_EXTRA_HEADERS variable.
# The do_install() function below will install the extra header files
# automatically.
# Users can also define their own do_install() to install to
# "${D}${LINUX_EXTRA_HEADER_BASE}"
LINUX_EXTRA_HEADERS ?= ""

kernel-extra-headers_do_install() {
    incdir="${D}${LINUX_EXTRA_HEADER_BASE}"
    install -d $incdir
    for file in ${LINUX_EXTRA_HEADERS}; do
        install -D -m 0644 $file ${incdir}/$file
    done
}

FILES_${PN}-dev += "${LINUX_EXTRA_HEADER_BASE}"
