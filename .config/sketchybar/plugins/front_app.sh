#!/usr/bin/env sh

case $INFO in
  "Discord")
    ICON=ﭮ
    ;;
  "FaceTime")
    ICON=
    ;;
  "Finder")
    ICON=
    ;;
  "Google Chrome")
    ICON=
    ;;
  "Spotify")
    ICON=
    ;;
  "iTerm2")
    ICON=
    ;;
  *)
    ICON=﯂
    ;;
esac

sketchybar --set $NAME icon=$ICON label="$INFO"
