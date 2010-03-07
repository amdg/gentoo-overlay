# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils subversion

DESCRIPTION="Real-time video capture of OpenGL applications (rewrite branch)"
HOMEPAGE="https://devel.neopsis.com/projects/yukon"
ESVN_REPO_URI="https://devel.neopsis.com/svn/yukon/branches/rewrite"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=x11-libs/seom-9999"
RDEPEND="${DEPEND}"

src_prepare() {
	epatch "${FILESDIR}"/001-fix_library_install_paths.patch || die "Patch failed"
}

src_install() {
	einstall DESTDIR="${D}" || die "Install failed"

	newbin filter seom-filter

	newbin play-stream.sh seom-play
	dosed 's:\./filter:seom-filter:' usr/bin/seom-play

	insinto /etc/yukon
	newins tools/yukon.conf conf

	insinto /etc/yukon/system
	newins sysconf default
}

pkg_postinst() {
	echo
	einfo "If you get a \"Cannot seek backward in linear streams! Seek failed.\""
	einfo "error message, try adding this to your mplayer config file"
	einfo "(\$HOME/.mplayer/config):"
	einfo ""
	einfo "cache=8192"
	echo
}
