# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Broadcom Crystal HD Decoder firmware"
HOMEPAGE="https://github.com/kcning/crystalhd-firmware"
SRC_URI="https://github.com/kcning/crystalhd-firmware/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="broadcom_bcm70012"
SLOT="0"
KEYWORDS="~amd64 ~x86"

src_install() {
	insinto /lib/firmware
	doins bcm70012fw.bin
	doins bcm70015fw.bin
}
