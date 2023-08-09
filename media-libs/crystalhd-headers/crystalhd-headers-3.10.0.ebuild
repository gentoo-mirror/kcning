# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Broadcom Crystal HD headers for kernel driver and library"
HOMEPAGE="https://github.com/kcning/crystalhd-headers"
SRC_URI="https://github.com/kcning/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"

src_compile() {
	true
}

src_install() {
	insinto /usr/include
	doins -r "${S}"/include/*
}
