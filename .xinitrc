#!/bin/sh

## WARNING: If started from TTY on a multi-seat, the user must run 'startx &
## vlock' to ensure the X locker cannot be bypassed.

## Run site init scripts. Usually not necessary.
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

## Source environment config.
[ -f ~/.xprofile ] && . ~/.xprofile

## `exwm-enable' has to be called before the frame is spawned.
emacs --daemon -f exwm-enable
exec emacsclient -c
