# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# ebuild generated by hackport 0.3.1.9999

CABAL_FEATURES="bin lib profile haddock hoogle hscolour"
inherit haskell-cabal

DESCRIPTION="Combinators for executing IO actions in parallel on a thread pool"
HOMEPAGE="http://batterseapower.github.com/parallel-io"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">dev-haskell/extensible-exceptions-0.1.0.1:=[profile?]
		=dev-haskell/random-1.0*:=[profile?]
		>=dev-lang/ghc-6.10.4:="
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.2"

src_configure() {
	haskell-cabal_src_configure \
		--flag=-tests \
		--flag=-fuzz \
		--flag=-benchmark
}
