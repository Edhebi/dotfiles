#!/bin/sh

wal -R

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
polybar master &

if xautolock -time 5 -locker "~/.bin/lockscreen" -notifier "xset dpms force off" 2>/dev/null
then
	xautolock -time 7 -locker "systemctl suspend" >/dev/null
fi

pgrep -x twmnd >/dev/null || twmnd >/dev/null &

