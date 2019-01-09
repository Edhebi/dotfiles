#!/bin/bash

I3DIR="${XDG_CONFIG_HOME:-$HOME/.config}/i3"
CONFD="$I3DIR/config.d"

echo "### GENERATED FILE, DONT EDIT MANUALY" > "$I3DIR/config"

cat $(ls $CONFD | awk "{print \"$CONFD/\"\$1}") >> "$I3DIR/config"
