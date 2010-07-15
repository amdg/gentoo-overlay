# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="A multi-functional, console-based Twitter client"
HOMEPAGE="http://www.floodgap.com/software/ttytter/"
SRC_URI="http://www.floodgap.com/software/ttytter/dist1/${PV}.txt"

LICENSE="FFSL"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
DEPEND=""
RDEPEND=">=dev-lang/perl-5.8
	|| ( net-misc/curl www-client/lynx )"

src_unpack() {
	cp "${DISTDIR}"/${A} "${S}" || die "Copy failed"
}

src_install() {
	newbin "${S}" ttytter || die "Install failed"
}
