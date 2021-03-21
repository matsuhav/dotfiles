#!/usr/bin/env bash
set -euo pipefail

if [[ $EUID != 0 ]]; then
	sudo "$0" "$@"
	exit
fi

patchscreen=$(realpath $(dirname $0))
ver=$(wget -qO- 'http://ftp.gnu.org/gnu/screen/?C=M;O=D' | grep -Po '(?<=href="screen-)[0-9.]+(?=\.tar\.gz")' | head -n1)
dir=screen-$ver
url=http://ftp.gnu.org/gnu/screen/$dir.tar.gz

loc=$(screen --version |& grep -Po '(?<= )[0-9.]+(?= )' || true)
if [[ -z $loc ]]; then
	loc="Not installed"
fi
echo "Installed:     $loc"
echo "Remote latest: $ver"

arg=${1:-""}
if [[ $arg == -n || $loc == $ver && $arg != -f ]]; then
	exit
fi

tmp=$(mktemp)
mkdir -p /usr/local/src
cd /usr/local/src
rm -rf $dir
wget -qO $tmp $url
tar -xf $tmp
cd $dir
patch -i $patchscreen/disable-utmp.patch
patch -i $patchscreen/no-check-dirs-permission.patch
./autogen.sh
./configure --prefix=/usr/local --enable-colors256 --disable-pam
make -j4
make install
cp /usr/local/src/$dir/etc/etcscreenrc /usr/local/etc/screenrc
cat /usr/local/src/$dir/terminfo/screencap >> /etc/termcap
rm -f $tmp
