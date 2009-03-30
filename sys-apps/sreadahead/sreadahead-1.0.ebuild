# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

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
	dodoc README Changelog 0001-kernel-trace-open.patch || die
	newinitd "${FILESDIR}"/sreadahead-1.0.rc sreadahead || die
	#newinitd "${FILESDIR}"/sreadahead-pack.rc sreadahead-pack || die
}

pkg_postinst() {
	elog "Sreadahead requires a kernel built with the kernel-trace-open patch"
	elog "found in /usr/share/doc/${PF}"
	elog "If you don't know how to do this, it may be best to stay away from it"
	elog ""
	elog "Note that only ext3 partitions are currently supported."
	elog ""
	elog "To add sreadahead to your runlevels:"
	elog "  # rc-update add sreadahead boot"
	#elog "  # rc-update add sreadahead-pack default"
}
