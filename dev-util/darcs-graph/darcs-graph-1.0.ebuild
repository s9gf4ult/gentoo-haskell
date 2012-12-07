# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# ebuild generated by hackport 0.3.1.9999

CABAL_FEATURES="bin"
inherit haskell-cabal

DESCRIPTION="Generate graphs of darcs repository activity"
HOMEPAGE="http://hackage.haskell.org/package/darcs-graph"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="sci-visualization/gnuplot"
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.2
		>=dev-lang/ghc-6.10.4"

src_prepare() {
	epatch "${FILESDIR}"/${P}-base-4.patch

	cabal_chdeps \
		'base >= 3 && < 4' 'base >= 4 && < 5'
}
