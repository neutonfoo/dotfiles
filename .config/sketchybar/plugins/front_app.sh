#!/usr/bin/env sh

ICON_PADDING_RIGHT=10

case $INFO in
  "Discord")
    ICON=ﭮ
    ;;
  "FaceTime")
    ICON_PADDING_RIGHT=11
    ICON=
    ;;
  "Finder")
    ICON=
    ;;
  "Google Chrome")
    ICON_PADDING_RIGHT=7
    ICON=
    ;;
  "Spotify")
    ICON=
    ;;
  "iTerm2")
    ICON_PADDING_RIGHT=8
    ICON=
    ;;
  *)
    ICON=﯂
    ;;
esac

sketchybar --set $NAME icon=$ICON icon.padding_right=$ICON_PADDING_RIGHT
sketchybar --set $NAME.name label="$INFO"
