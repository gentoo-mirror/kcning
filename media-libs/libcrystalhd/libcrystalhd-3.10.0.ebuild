# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Broadcom Crystal HD library"
HOMEPAGE="https://github.com/kcning/libcrystalhd"
SRC_URI="https://github.com/kcning/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-2.1"
SLOT="0"
KEYWORDS="~amd64 ~x86"

BDEPEND="media-libs/crystalhd-headers"

src_prepare() {
	default
	sed -i "s/LIBDIR=\/usr\/lib/LIBDIR=\/usr\/$(get_libdir)/" "${S}"/Makefile || die
}

src_install() {
	emake DESTDIR="${D}" install
	# do not install README.md
}
