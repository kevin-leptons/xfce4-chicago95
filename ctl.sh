#!/bin/bash

NAME="xfce4-chicago95"
VERSION="1.0.0"
PACKAGE_VERSION="1"
DIST="dist"
DIST_ROOT="${DIST}/${NAME}_${VERSION}-${PACKAGE_VERSION}"
SRC="src"

ctl_help()
{
        echo "NAME"
        echo "  $0 - Development console for this project"
        echo ""

        echo "SYNOPSIS"        
        echo "  $0 COMMAND"
        echo "  $0 --help, -h"
        echo

        echo "COMMAND"
        echo "  dist            Pack all of components into Debian package"
        echo "  clear           Clear temporary files"
}

ctl_dist()
{
        rm -rf $DIST

        mkdir -vp ${DIST_ROOT}/usr/share/themes
        cp -r $SRC/Theme/Chicago95 ${DIST_ROOT}/usr/share/themes/${NAME}

        mkdir -vp ${DIST_ROOT}/usr/share/icons
        cp -r ${SRC}/Icons/Chicago95 ${DIST_ROOT}/usr/share/icons/${NAME}

        mkdir -vp ${DIST_ROOT}/usr/share/icons
        cp -r ${SRC}/Cursors/Chicago95_Cursor_Black \
                ${DIST_ROOT}/usr/share/icons/${NAME}_cursor_black

        mkdir -vp ${DIST_ROOT}/usr/bin
        cp ${SRC}/cli.sh ${DIST_ROOT}/usr/bin/${NAME}

        mkdir -vp ${DIST_ROOT}/DEBIAN
        cp ${SRC}/debian/control ${DIST_ROOT}/DEBIAN
        sed -i -- "s/\$NAME/${NAME}/g" ${DIST_ROOT}/DEBIAN/control
        sed -i -- "s/\$VERSION/${VERSION}/g" ${DIST_ROOT}/DEBIAN/control
        sed -i -- "s/\$PACKAGE_VERSION/${PACKAGE_VERSION}/g" \
                ${DIST_ROOT}/DEBIAN/control
        dpkg-deb --build -D $DIST_ROOT $DIST
}

ctl_clear()
{
        rm -rf $DIST
}

case "$1" in
        dist) ctl_dist; exit 0;;
        clear) ctl_clear; exit 0;;
        --help) ctl_help; exit 0;;
        -h) ctl_help; exit 0;;
        *) ctl_help; exit 1;;
esac
