# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit linux-mod-r1 udev

DESCRIPTION="Broadcom Crystal HD Hardware Decoder Driver"
HOMEPAGE="https://github.com/kcning/crystalhd-dkms"
SRC_URI="https://github.com/kcning/crystalhd-dkms/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/crystalhd-dkms-${PV}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="media-libs/crystalhd-firmware"
BDEPEND="media-libs/crystalhd-headers"

src_compile() {
	local modlist=( crystalhd )
	local modargs=( KVER=${KV_FULL} )

	linux-mod-r1_src_compile
}

src_install() {
	linux-mod-r1_src_install

	insinto /lib/udev/rules.d
	doins "${S}"/20-crystalhd.rules
}

pkg_postinst() {
	udev_reload
}

pkg_postrm() {
	udev_reload
}
