# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_PN=undervolt
PYTHON_COMPAT=( python3_{10..11} )
inherit distutils-r1

DESCRIPTION="Undervolt Intel CPUs under Linux"
HOMEPAGE="
	https://pypi.org/project/undervolt/
	https://github.com/georgewhewell/undervolt
"

if [[ ${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/georgewhewell/undervolt.git"
else
	inherit pypi
	KEYWORDS="~amd64 ~x86"
	S="${WORKDIR}/${PYPI_PN}-${PV}"
fi

LICENSE="GPL-2"
SLOT="0"
