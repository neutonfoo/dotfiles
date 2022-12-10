#!/usr/bin/env sh

case "$SENDER" in
  "mouse.clicked")
    osascript -e 'tell application "Spotify" to play next track'
    # osascript -e 'tell application "Spotify" to set shuffling to true'
    ;;
esac

