# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils versionator

MY_PV=$(replace_all_version_separators '')

DESCRIPTION="A multi-functional, fully 100% text, Perl command line Twitter client"
HOMEPAGE="http://www.floodgap.com/software/ttytter/"
SRC_URI="http://www.floodgap.com/software/ttytter/old/${MY_PV}.txt"

LICENSE="FFSL"
SLOT="0"
KEYWORDS="amd64"
IUSE=""
DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
	cp ${DISTDIR}/${A} ${S}
}

src_compile() {
	return 0
}

src_install() {
	newbin ${S} ttytter
}
