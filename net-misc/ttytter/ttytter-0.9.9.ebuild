# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils versionator

MY_PV=$(replace_all_version_separators '')

DESCRIPTION="A multi-functional, fully 100% text, Perl command line Twitter client"
HOMEPAGE="http://www.floodgap.com/software/ttytter/"
SRC_URI="http://www.floodgap.com/software/ttytter/ttytter.txt"

LICENSE="FFSL"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
DEPEND=""
RDEPEND=">=dev-lang/perl-5.8
	|| (>=net-misc/curl-7.19.4 >=www-client/lynx-2.8.6-r2)"

src_unpack() {
	cp ${DISTDIR}/${A} ${S}
}

src_compile() {
	return 0
}

src_install() {
	newbin ${S} ttytter
}
