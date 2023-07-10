# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_COMMIT="53d3314a810017b6056ab6796aef671f5ea1c063"

inherit elisp

DESCRIPTION="Integrating Vim-style tabs for Evil mode users"
HOMEPAGE="https://github.com/krisajenkins/evil-tabs"
SRC_URI="https://github.com/krisajenkins/evil-tabs/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN}-${EGIT_COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	app-emacs/evil
	app-emacs/elscreen
"
