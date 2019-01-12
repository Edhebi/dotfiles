#!/bin/sh

wal -R

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
polybar master &

if xautolock -time 5 -locker "~/.bin/lockscreen" -notifier "xset dpms force off" 2>/dev/null
then
	xautolock -time 7 -locker "systemctl suspend" >/dev/null
fi

killall -q compton
while pgrep -u $UID -x compton>/dev/null; do sleep 1; done
compton --config ~/.config/compton/compton.conf -b 2>&1 >/dev/null &
