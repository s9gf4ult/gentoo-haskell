# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# ebuild generated by hackport 0.3

CABAL_FEATURES="bin"
inherit eutils haskell-cabal git-2

MY_PN="Combinatorrent"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="A concurrent bittorrent client"
HOMEPAGE="http://hackage.haskell.org/package/Combinatorrent"
# SRC_URI="mirror://hackage/packages/archive/${MY_PN}/${PV}/${MY_P}.tar.gz"
EGIT_REPO_URI="git://github.com/jlouis/combinatorrent.git"
EGIT_REPACK="1"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
		>=dev-haskell/attoparsec-0.8
		>=dev-haskell/cabal-1.6
		=dev-haskell/cereal-0.3*
		dev-haskell/cryptohash
		dev-haskell/deepseq
		dev-haskell/hslogger
		dev-haskell/http
		dev-haskell/hunit
		dev-haskell/mtl
		dev-haskell/network
		<dev-haskell/parsec-4
		dev-haskell/psqueue
		>=dev-haskell/quickcheck-2.4 <dev-haskell/quickcheck-2.6
		dev-haskell/random
		dev-haskell/random-shuffle
		dev-haskell/stm
		dev-haskell/test-framework
		dev-haskell/test-framework-hunit
		dev-haskell/test-framework-quickcheck2
		dev-haskell/text
		>=dev-lang/ghc-6.12.1"

S="${WORKDIR}/${MY_P}"

src_prepare() {
	epatch "${FILESDIR}"/${P}-bs-0.10.patch

	CABAL_FILE=${MY_PN}.cabal cabal_chdeps \
		'QuickCheck == 2.4.*' 'QuickCheck >= 2.4 && <2.6'
}
