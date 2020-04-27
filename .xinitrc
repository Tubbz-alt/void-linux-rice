#!/bin/sh

# ------------------------ My personal stuff ----------------------------------

# reload fonts
# xset +fp /usr/share/fonts/local
# xset fp rehash

# reload pywall colors
# wal -R

# Xresources stuff
# xrdb -merge "$HOME/.Xresources"

# start fan daemon if not already running
# if pidof -x mbpfan >/dev/null; then
# 	echo "mbpfan is already up and running"
# else
# 	mbpfan
# fi

# start syncthing (incase the systemd service doesnt start)
# if pidof -x syncthing >/dev/null; then
# 	echo "syncthing is already up and running"
# else
# 	syncthing --no-browser &
# fi

# ------------------------ switch WMs and DEs ---------------------------------


exec bspwm # keep bspwm specific autostarts in .congif/bspwm/bspwmrc
xsetroot -cursor_name left_ptr
