#!/usr/bin/env sh

echo $MODIFIER

case "$SENDER" in
  "mouse.clicked") 
    if [ $MODIFIER = "shift" ]; then
      open "https://www.lichess.org/"
    else
      open "https://www.reddit.com/r/all/"
    fi
esac

