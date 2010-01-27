# Copyright 1999-2009 Gentoo Foundation
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
	insinto /etc
	doins tools/yukon.conf
	insinto /etc/yukon/system
	newins sysconf default
}
