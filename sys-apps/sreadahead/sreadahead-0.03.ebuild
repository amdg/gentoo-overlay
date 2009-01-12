# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="A readahead implementation optimized for solid state discs"
HOMEPAGE="http://code.google.com/p/sreadahead/"
SRC_URI="http://sreadahead.googlecode.com/files/${P}.tar.gz"
LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
DEPEND=""
RDEPEND=""

src_unpack() {
	unpack ${A}
	epatch ${FILESDIR}/001-remove-hardcoded-cflags.patch
}

src_compile() {
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
