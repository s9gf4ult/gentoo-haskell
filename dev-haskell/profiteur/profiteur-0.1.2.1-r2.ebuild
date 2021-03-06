# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# ebuild generated by hackport 0.3.6.9999

CABAL_FEATURES="bin"
inherit haskell-cabal

DESCRIPTION="Treemap visualiser for GHC prof files"
HOMEPAGE="http://github.com/jaspervdj/profiteur"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}
	>=dev-haskell/aeson-0.6 <dev-haskell/aeson-0.8
	>=dev-haskell/attoparsec-0.10 <dev-haskell/attoparsec-0.13
	>=dev-haskell/cabal-1.8
	>=dev-haskell/text-0.11
	>=dev-haskell/unordered-containers-0.2 <dev-haskell/unordered-containers-0.3
	>=dev-haskell/vector-0.10 <dev-haskell/vector-0.11
	>=dev-lang/ghc-7.4.1
"

src_prepare() {
	cabal_chdeps \
		'attoparsec           >= 0.10 && < 0.12' 'attoparsec           >= 0.10 && < 0.13' \
		'text                 >= 0.11 && < 1.2' 'text                 >= 0.11'
}
