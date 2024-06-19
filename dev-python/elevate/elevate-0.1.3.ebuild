# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} )
inherit distutils-r1 pypi

DESCRIPTION="Python library for requesting root privileges "
HOMEPAGE="
	https://pypi.org/project/elevate/
	https://github.com/barneygale/elevate
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
