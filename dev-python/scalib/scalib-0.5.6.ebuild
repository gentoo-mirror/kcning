# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
	ahash@0.8.11
	aho-corasick@1.1.2
	allocator-api2@0.2.16
	anes@0.1.6
	approx@0.4.0
	approx@0.5.1
	arbitrary@1.3.2
	ariadne@0.1.5
	atomic@0.5.3
	atty@0.2.14
	autocfg@1.1.0
	bincode@1.3.3
	bindgen@0.64.0
	bindgen@0.69.4
	bitflags@1.3.2
	bitflags@2.4.2
	blis-src@0.2.1
	blis-sys2@0.2.2
	bumpalo@3.15.3
	bytemuck@1.14.3
	byteorder@1.5.0
	cast@0.3.0
	cc@1.0.90
	cexpr@0.6.0
	cfg-if@1.0.0
	chumsky@0.9.3
	ciborium-io@0.2.2
	ciborium-ll@0.2.2
	ciborium@0.2.2
	clang-sys@1.7.0
	clap@3.2.25
	clap_lex@0.2.4
	codespan-reporting@0.11.1
	color_quant@1.1.0
	console@0.15.8
	criterion-plot@0.5.0
	criterion@0.4.0
	crossbeam-deque@0.8.5
	crossbeam-epoch@0.9.18
	crossbeam-utils@0.8.19
	crunchy@0.2.2
	cxx-build@1.0.119
	cxx@1.0.119
	cxxbridge-flags@1.0.119
	cxxbridge-macro@1.0.119
	derive_arbitrary@1.3.2
	either@1.10.0
	encode_unicode@0.3.6
	equivalent@1.0.1
	errno@0.3.8
	fixedbitset@0.4.2
	getrandom@0.2.12
	glob@0.3.1
	half@2.4.0
	hashbrown@0.12.3
	hashbrown@0.14.3
	hermit-abi@0.1.19
	hermit-abi@0.3.9
	home@0.5.9
	hytra@0.1.2
	image@0.24.9
	index_vec@0.1.3
	indexmap@1.9.3
	indexmap@2.2.5
	indicatif@0.17.8
	indoc@1.0.9
	instant@0.1.12
	itertools@0.10.5
	itertools@0.12.1
	itoa@1.0.10
	js-sys@0.3.69
	kdtree@0.5.1
	lazy_static@1.4.0
	lazycell@1.3.0
	libc@0.2.153
	libloading@0.8.3
	libm@0.2.8
	link-cplusplus@1.0.9
	linux-raw-sys@0.4.13
	lock_api@0.4.11
	log@0.4.21
	matrixmultiply@0.3.8
	memchr@2.7.1
	memoffset@0.8.0
	minimal-lexical@0.2.1
	nalgebra-macros@0.1.0
	nalgebra@0.30.1
	ndarray-rand@0.14.0
	ndarray-stats@0.5.1
	ndarray@0.15.6
	noisy_float@0.2.0
	nom@7.1.3
	nshare@0.9.0
	num-complex@0.4.5
	num-integer@0.1.46
	num-rational@0.4.1
	num-traits@0.2.18
	num_cpus@1.16.0
	number_prefix@0.4.0
	numpy@0.18.0
	once_cell@1.19.0
	oorandom@11.1.3
	os_str_bytes@6.6.1
	parking_lot@0.12.1
	parking_lot_core@0.9.9
	paste@1.0.14
	peeking_take_while@0.1.2
	petgraph@0.6.4
	plotters-backend@0.3.5
	plotters-svg@0.3.5
	plotters@0.3.5
	portable-atomic@1.6.0
	ppv-lite86@0.2.17
	prettyplease@0.2.16
	primal-check@0.3.3
	proc-macro2@1.0.78
	psm@0.1.21
	pyo3-build-config@0.18.3
	pyo3-ffi@0.18.3
	pyo3-macros-backend@0.18.3
	pyo3-macros@0.18.3
	pyo3@0.18.3
	quote@1.0.35
	rand@0.8.5
	rand_chacha@0.3.1
	rand_core@0.6.4
	rand_distr@0.4.3
	rand_xoshiro@0.6.0
	rawpointer@0.2.1
	rayon-core@1.12.1
	rayon@1.9.0
	realfft@2.0.1
	realfft@3.3.0
	redox_syscall@0.4.1
	regex-automata@0.4.6
	regex-syntax@0.8.2
	regex@1.10.3
	rustc-hash@1.1.0
	rustfft@6.2.0
	rustix@0.38.31
	ryu@1.0.17
	safe_arch@0.7.1
	same-file@1.0.6
	scopeguard@1.2.0
	scratch@1.0.7
	serde@1.0.197
	serde_derive@1.0.197
	serde_json@1.0.114
	shlex@1.3.0
	simba@0.7.3
	smallvec@1.13.1
	stacker@0.1.15
	strength_reduce@0.2.4
	syn@1.0.109
	syn@2.0.52
	target-lexicon@0.12.14
	termcolor@1.4.1
	textwrap@0.16.1
	thiserror-impl@1.0.57
	thiserror@1.0.57
	thread_local@1.1.8
	tinytemplate@1.2.1
	transpose@0.2.3
	typenum@1.17.0
	unicode-ident@1.0.12
	unicode-width@0.1.11
	unindent@0.1.11
	version_check@0.9.4
	walkdir@2.5.0
	wasi@0.11.0+wasi-snapshot-preview1
	wasm-bindgen-backend@0.2.92
	wasm-bindgen-macro-support@0.2.92
	wasm-bindgen-macro@0.2.92
	wasm-bindgen-shared@0.2.92
	wasm-bindgen@0.2.92
	web-sys@0.3.69
	which@4.4.2
	wide@0.7.15
	winapi-i686-pc-windows-gnu@0.4.0
	winapi-util@0.1.6
	winapi-x86_64-pc-windows-gnu@0.4.0
	winapi@0.3.9
	windows-sys@0.52.0
	windows-targets@0.48.5
	windows-targets@0.52.4
	windows_aarch64_gnullvm@0.48.5
	windows_aarch64_gnullvm@0.52.4
	windows_aarch64_msvc@0.48.5
	windows_aarch64_msvc@0.52.4
	windows_i686_gnu@0.48.5
	windows_i686_gnu@0.52.4
	windows_i686_msvc@0.48.5
	windows_i686_msvc@0.52.4
	windows_x86_64_gnu@0.48.5
	windows_x86_64_gnu@0.52.4
	windows_x86_64_gnullvm@0.48.5
	windows_x86_64_gnullvm@0.52.4
	windows_x86_64_msvc@0.48.5
	windows_x86_64_msvc@0.52.4
	yansi@0.5.1
	zerocopy-derive@0.7.32
	zerocopy@0.7.32
"

CARGO_OPTIONAL=1
DISTUTILS_USE_PEP517=setuptools
DISTUTILS_EXT=1
PYTHON_COMPAT=( python3_{10..12} )
inherit cargo distutils-r1 pypi

DESCRIPTION="Side-Channel Analysis Library"
HOMEPAGE="
	https://pypi.org/project/scalib
	https://github.com/simple-crypto/SCALib
"
SRC_URI="
	$(pypi_sdist_url "${PN^}" "${PV}")
	${CARGO_CRATE_URIS}
"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/numpy-1.19
	>=dev-python/py-cpuinfo-9.0.0
"

BDEPEND="
	virtual/rust
	dev-python/setuptools-rust[${PYTHON_USEDEP}]
"

# Rust does not respect CFLAGS/LDFLAGS
QA_FLAGS_IGNORED=".*/_rust.*"

PATCHES=(
	"${FILESDIR}/${P}"-cargo-update.patch
)

src_unpack() {
	cargo_src_unpack
}

distutils_enable_tests pytest

src_prepare() {
	if use test; then
		PATCHES+=( "${FILESDIR}/${P}"-fix-test.patch )
	fi
	distutils-r1_src_prepare
}

EPYTEST_IGNORE=(
	# require sci-libs/scikit-learn
	tests/test_lda.py
)
