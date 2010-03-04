# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit eutils depend.php

DESCRIPTION="An open source compiler for PHP with support for plugins"
HOMEPAGE="http://phpcompiler.org/"
SRC_URI="http://phpcompiler.org/src/archive/${P}.tar.gz"
LICENSE="BSD"

SLOT="0"
KEYWORDS="~amd64"
IUSE="+compiler doc +xmlparser graphviz"
RESTRICT="strip"

DEPEND=">=dev-libs/boehm-gc-7.1
	>=dev-libs/boost-1.34
	compiler? ( >=dev-lang/php-5.2.8-r1[embed] )
	doc? ( >=app-text/openjade-1.3.2-r1
	>=app-text/docbook-dsssl-stylesheets-1.79
	app-text/docbook-sgml-dtd:3.1 )
	xmlparser? ( >=dev-libs/xerces-c-3.0.0-r1 )"

RDEPEND=">=dev-libs/boehm-gc-7.1
	>=dev-libs/boost-1.34
	compiler? ( >=dev-lang/php-5.2.8-r1[embed] )
	xmlparser? ( >=dev-libs/xerces-c-3.0.0-r1 )
	graphviz? ( >=media-gfx/graphviz-2.20.3 )"

src_prepare() {
	epatch "${FILESDIR}"/fix_sed_ldflags.patch
}

src_configure() {
	if use compiler; then
		uses_php5
	fi
	econf $(use_with compiler php ${PHPPREFIX}) || die "econf failed"
}

src_compile() {
	emake || die "emake failed"

	if use doc; then
		cd doc/manual
		emake || die "emake (docs) failed"
	fi
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"

	dodoc ChangeLog || die "dodoc failed"

	if use doc; then
		dohtml doc/manual/*.html || die "dohtml failed"
		dohtml -r doc/manual/code || die "dohtml failed"
		dohtml -r doc/manual/img || die "dohtml failed"
	fi
}
