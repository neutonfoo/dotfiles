#!/usr/bin/env sh

case ${INFO} in
  [1-9][0-9]|100)
    ICON=""
    ICON_PADDING_RIGHT=5
    ;;
  [1-9])
    ICON=""
    ICON_PADDING_RIGHT=12
    ;;
  *)
    INFO=0
    ICON=""
    ICON_PADDING_RIGHT=22
esac

sketchybar --set $NAME icon=$ICON icon.padding_right=$ICON_PADDING_RIGHT label=$INFO
