# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Package manager for the C programming language"
HOMEPAGE="https://github.com/clibs/clib"
SRC_URI="https://github.com/clibs/clib/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="net-misc/curl"
RDEPEND="${DEPEND}"

src_install() {
	emake PREFIX="${D}"/usr install
}
