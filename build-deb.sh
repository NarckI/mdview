#!/bin/sh
# Builds dist/mdview_<version>_all.deb from the files in this repo.
set -e
cd "$(dirname "$0")"
VER=$(grep '^Version:' packaging/DEBIAN/control | awk '{print $2}')
STAGE=$(mktemp -d)
mkdir -p "$STAGE/usr/bin" "$STAGE/usr/share/applications" "$STAGE/DEBIAN"
install -m 755 src/mdview "$STAGE/usr/bin/mdview"
install -m 644 packaging/mdview.desktop "$STAGE/usr/share/applications/mdview.desktop"
install -m 644 packaging/DEBIAN/control "$STAGE/DEBIAN/control"
install -m 755 packaging/DEBIAN/postinst "$STAGE/DEBIAN/postinst"
mkdir -p dist
dpkg-deb --root-owner-group --build "$STAGE" "dist/mdview_${VER}_all.deb"
rm -rf "$STAGE"
echo "Built dist/mdview_${VER}_all.deb"
