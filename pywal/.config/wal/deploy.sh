#!/bin/sh

rebuild() { cd $HOME/localpkg/$1 && makepkg -sif --noconfirm; }

rebuild st >/dev/null
rebuild dmenu >/dev/null

DM_IMG="/usr/share/lightdm-webkit/themes/litarvan/img"
DM_BG="$DM_IMG/$(ls $DM_IMG | grep background)"

cp $(<$HOME/.cache/wal/wal) $DM_BG

