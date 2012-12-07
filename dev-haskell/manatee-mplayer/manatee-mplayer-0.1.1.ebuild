# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header:  $

# ebuild generated by hackport 0.2.13

EAPI="3"

CABAL_FEATURES="bin lib profile haddock hscolour"
inherit base haskell-cabal

DESCRIPTION="Mplayer client extension for Manatee."
HOMEPAGE="http://hackage.haskell.org/package/manatee-mplayer"
SRC_URI="mirror://hackage/packages/archive/${PN}/${PV}/${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-haskell/binary
		=dev-haskell/dbus-client-0.4*
		dev-haskell/dbus-core
		dev-haskell/derive
		>=dev-haskell/gio-0.12.0
		>=dev-haskell/gtk-0.12.0
		>=dev-haskell/libtagc-0.12.0
		>=dev-haskell/manatee-core-0.1.1
		>=dev-haskell/regex-tdfa-1.1.2
		>=dev-haskell/stm-2.1.2.0
		>=dev-haskell/text-0.7.1.0
		>=dev-haskell/utf8-string-0.3.4
		>=dev-lang/ghc-6.12.1"
DEPEND="${RDEPEND}
		>=dev-haskell/cabal-1.6"

PATCHES=("${FILESDIR}/${P}-dbus-client-0.4.patch")
