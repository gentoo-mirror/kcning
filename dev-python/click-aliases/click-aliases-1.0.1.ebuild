# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
PYPI_PN="click-aliases"
PYTHON_COMPAT=( python3_{10..11} )
inherit distutils-r1 pypi

DESCRIPTION="Add (multiple) aliases to a click_ group or command."
HOMEPAGE="
	https://pypi.org/project/click-aliases
	https://github.com/click-contrib/click-aliases
"
S="${WORKDIR}/${PYPI_PN}-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-python/click[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

EPYTEST_DESELECT=(
	# https://github.com/click-contrib/click-aliases/issues/5
	tests/test_basic.py::test_invalid
	tests/test_foobar.py::test_invalid
)

