#!/bin/bash

cli_active()
{
        local NAME="xfce4-chicago95"

        xfconf-query -c xsettings -p /Net/ThemeName -s $NAME
        xfconf-query -c xsettings -p /Net/IconThemeName -s $NAME
	xfconf-query -c xsettings -p /Gtk/KeyThemeName -s $NAME
	xfconf-query -c xsettings -p /Gtk/CursorThemeName -s \
		${NAME}_cursor_black
	xfconf-query -c xfwm4 -p /general/theme -s $NAME

}

cli_deactive()
{
        xfconf-query -c xsettings -p /Net/ThemeName -s "Xfce-4.0"
        xfconf-query -c xsettings -p /Net/IconThemeName -s "Tango"
	xfconf-query -c xsettings -p /Gtk/KeyThemeName -s "Default"
	xfconf-query -c xsettings -p /Gtk/CursorThemeName -s "Default"
	xfconf-query -c xfwm4 -p /general/theme -s "Default"

}

cli_help()
{
        local EXE_NAME=$(basename $0)
        echo "NAME"
        echo "  ${EXE_NAME} - XFCE4 theme look like Window95"
        echo ""

        echo "SYNOPSIS"
        echo "  ${EXE_NAME} COMMAND"
        echo "  ${EXE_NAME} --help, -h"
        echo ""

        echo "COMMANDS"
        echo "  active          Active Chicago95 themes"
        echo "  deactive        Active default XFCE4 themes"
}

case "$1" in
        active) cli_active; exit 0;;
        deactive) cli_deactive; exit 0;;
        --help) cli_help; exit 0;;
        -h) cli_help; exit 0;;
        *) cli_help; exit 1;;
esac
