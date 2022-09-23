#
# Copyright (C) 2022  Red Hat, Inc.
#
# This copyrighted material is made available to anyone wishing to use,
# modify, copy, or redistribute it subject to the terms and conditions of
# the GNU General Public License v.2, or (at your option) any later version.
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY expressed or implied, including the implied warranties of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General
# Public License for more details.  You should have received a copy of the
# GNU General Public License along with this program; if not, write to the
# Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
# 02110-1301, USA.  Any Red Hat trademarks that are incorporated in the
# source code or documentation are not subject to the GNU General Public
# License and may only be used or replicated with the express permission of
# Red Hat, Inc.
#
# Red Hat Author(s): Jiri Kortus <jikortus@redhat.com>

# This test covers https://bugzilla.redhat.com/show_bug.cgi?id=2063791

TESTTYPE="raid storage skip-on-fedora rhbz2122327 gh799"

. ${KSTESTDIR}/functions.sh

prepare_disks() {
    tmpdir=$1

    # Use ready-made sparse images that already contain the DDF RAID structure
    tar xJSf raid-ddf.tar.xz -C ${tmpdir}
    echo ${tmpdir}/disk-a.img ${tmpdir}/disk-b.img
}

additional_runner_args() {
    # Wait for reboot and shutdown of the VM,
    # but exit after the specified timeout.
    echo "--wait $(get_timeout)"
}

