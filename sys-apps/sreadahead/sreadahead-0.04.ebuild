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

src_compile() {
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc COPYING README 0001-superreadahead-patch.patch
	newinitd ${FILESDIR}/sreadahead.rc sreadahead
	newinitd ${FILESDIR}/sreadahead-pack.rc sreadahead-pack
}

pkg_postinst() {
	einfo "Sreadahead requires a kernel built with the superreadahead patch,"
	einfo "which can be found in /usr/share/doc/${PF}"
	einfo ""
	einfo "Note that only ext3 partitions are currently supported."
	einfo ""
	einfo "To add sreadahead to your runlevels:"
	einfo "  # rc-update add sreadahead boot"
	einfo "  # rc-update add sreadahead-pack default"
}
