#!/usr/bin/env sh

case ${INFO} in
  [6-9][0-9]|100)
    ICON=""
    ICON_PADDING_RIGHT=5
    ;;
  [1-5][0-9]|[1-9])
    ICON=""
    ICON_PADDING_RIGHT=11
    ;;
  *) ICON=""
    ICON_PADDING_RIGHT=15
esac

sketchybar --set $NAME icon=$ICON icon.padding_right=$ICON_PADDING_RIGHT
