# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

# ebuild generated by hackport 0.3.6.9999

CABAL_FEATURES="lib profile haddock hoogle hscolour"
inherit base haskell-cabal

DESCRIPTION="Java .class files assembler/disassembler"
HOMEPAGE="http://hackage.haskell.org/package/hs-java"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/${PV}"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-haskell/binary:=[profile?]
	dev-haskell/binary-state:=[profile?]
	dev-haskell/control-monad-exception:=[profile?]
	dev-haskell/data-binary-ieee754:=[profile?]
	>=dev-haskell/data-default-0.5.0:=[profile?]
	dev-haskell/glob:=[profile?]
	dev-haskell/libzip:=[profile?]
	dev-haskell/missingh:=[profile?]
	dev-haskell/mtl:=[profile?]
	>=dev-haskell/parsec-3:=[profile?] <dev-haskell/parsec-4:=[profile?]
	dev-haskell/utf8-string:=[profile?]
	>=dev-lang/ghc-6.10.4:=
"
DEPEND="${RDEPEND}
	>=dev-haskell/cabal-1.6.0.3
"

PATCHES=("${FILESDIR}"/${P}-cif-refs.patch)