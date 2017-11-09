#!/bin/bash

cli_active()
{
        xfconf-query -c xsettings -p /Net/ThemeName -s "chicago95"
        xfconf-query -c xsettings -p /Net/IconThemeName -s "chicago95"
	xfconf-query -c xsettings -p /Gtk/KeyThemeName -s "chicago95"
	xfconf-query -c xsettings -p /Gtk/CursorThemeName -s \
		"chicago95_cursor_black"
	xfconf-query -c xfwm4 -p /general/theme -s "chicago95"

}

cli_restore()
{
        xfconf-query -c xsettings -p /Net/ThemeName -s "Xfce-4.0"
        xfconf-query -c xsettings -p /Net/IconThemeName -s "Tango"
	xfconf-query -c xsettings -p /Gtk/KeyThemeName -s "Default"
	xfconf-query -c xsettings -p /Gtk/CursorThemeName -s "Default"
	xfconf-query -c xfwm4 -p /general/theme -s "Default"

}

cli_help()
{
        echo "NAME"
        echo "  $0 - XFCE4 theme look like Window95"
        echo ""

        echo "SYNOPSIS"
        echo "  $0 COMMAND"
        echo "  $0 --help, -h"
        echo ""

        echo "COMMANDS"
        echo "  active          Active Chicago95 themes"
        echo "  restore         Active default XFCE4 themes"
}

case "$1" in
        active) cli_active; exit 0;;
        restore) cli_restore; exit 0;;
        --help) cli_help; exit 0;;
        -h) cli_help; exit 0;;
        *) cli_help; exit 1;;
esac
