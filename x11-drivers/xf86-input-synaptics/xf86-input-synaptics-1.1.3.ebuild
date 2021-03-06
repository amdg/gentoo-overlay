# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/www/viewcvs.gentoo.org/raw_cvs/gentoo-x86/x11-drivers/xf86-input-synaptics/Attic/xf86-input-synaptics-1.1.3.ebuild,v 1.5 2009/10/11 11:23:27 nixnut Exp $

inherit toolchain-funcs eutils x-modular

DESCRIPTION="Driver for Synaptics touchpads"
HOMEPAGE="http://cgit.freedesktop.org/xorg/driver/xf86-input-synaptics/"
KEYWORDS="amd64 ppc ~ppc64 x86"
LICENSE="MIT"
IUSE="hal"
RDEPEND="x11-libs/libXext
	x11-libs/libXtst
	hal? ( sys-apps/hal )"
DEPEND="${RDEPEND}
	!x11-drivers/synaptics
	x11-base/xorg-server
	x11-proto/inputproto
	>=sys-apps/sed-4"

# Needs to be rebuild when migrating to xorg-server 1.6 to enable properties
# support
src_install() {
	DOCS="INSTALL NEWS TODO README"
	x-modular_src_install

	if use hal ; then
		insinto /usr/share/hal/fdi/policy/10osvendor
		doins "${S}"/fdi/11-x11-synaptics.fdi
	fi
}

pkg_postinst() {
	elog "This driver requires event interface support in your kernel: INPUT_EVDEV"
	if use hal ; then
		elog "Synaptics settings are now stored in:"
		elog "/etc/hal/fdi/policy/10osvendor/11-x11-synaptics.fdi"
		echo
		ewarn "Please see the examples here for inspiration, but not edit:"
		ewarn "/usr/share/hal/fdi/policy/10osvendor/11-x11-synaptics.fdi"
	fi
}
