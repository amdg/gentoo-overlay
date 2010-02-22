# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils toolchain-funcs subversion

DESCRIPTION="OpenGL video capturing library (packetized-stream branch)"
HOMEPAGE="https://devel.neopsis.com/projects/seom"
ESVN_REPO_URI="https://devel.neopsis.com/svn/seom/branches/packetized-stream"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-lang/yasm-0.5.0"
RDEPEND=""

src_prepare() {
	epatch "${FILESDIR}"/001-get_version_from_ebuild.patch
	epatch "${FILESDIR}"/002-remove_hardcoded_cflags.patch
}

src_compile() {
	emake || die "emake failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
}
