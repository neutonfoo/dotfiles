#!/usr/bin/env sh

update_space() {
  SPACE_ID=$(echo "$INFO" | jq -r '."display-1"')

  case $SPACE_ID in
    1)
      ICON=
      ICON_PADDING=7
      ;;
    *)
      ICON=$SPACE_ID
      ICON_PADDING=10
      ;;
  esac

  sketchybar --set $NAME \
    icon=$ICON \
    icon.padding_left=$ICON_PADDING \
    icon.padding_right=$ICON_PADDING

}

case "$SENDER" in
  "mouse.clicked") 
    # Reload sketchybar
    sketchybar --remove '/.*/'
    source $HOME/.config/sketchybar/sketchybarrc
    ;;
  *)
    update_space
    ;;
esac
