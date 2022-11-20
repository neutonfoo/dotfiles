#!/usr/bin/env sh

# Max number of characters so it fits nicely to the right of the notch

MAX_LENGTH=35

# Logic starts here, do not modify
HALF_LENGTH=$((MAX_LENGTH / 2))

# Spotify JSON / $INFO comes in malformed, line below sanitizes it

SPOTIFY_JSON="{$(echo $INFO | iconv -f utf-8 -t utf-8 -c | cut -d'}' -f1 | cut -d'{' -f2)}"

update_track() {
  PLAYER_STATE=$(echo "$SPOTIFY_JSON" | jq -r '.["Player State"]')

  if [ $PLAYER_STATE = "Playing" ]; then
    TRACK="$(echo "$SPOTIFY_JSON" | jq -r .Name)"
    ARTIST="$(echo "$SPOTIFY_JSON" | jq -r .Artist)"
    
    # Calculations so it fits nicely

    TRACK_LENGTH=${#TRACK}
    ARTIST_LENGTH=${#ARTIST}

    if [ $TRACK_LENGTH -gt $HALF_LENGTH ] && [ $ARTIST_LENGTH -gt $HALF_LENGTH ]; then
      # If both the track and artist are too long, cut both at half length - 1

      TRACK="$(echo "$TRACK" | sed 's/\(.\{'$(( HALF_LENGTH - 2 ))'\}\).*/\1…/')"
      ARTIST="$(echo "$ARTIST" | sed 's/\(.\{'$(( HALF_LENGTH - 2 ))'\}\).*/\1…/')"

    elif [ $TRACK_LENGTH -gt $HALF_LENGTH ]; then
      # Else if only the track is too long, cut it by the difference of the max length and artist length
      # If the max length is odd, have to subtract 2 chars instead of 1 for the ellipse
      TRACK="$(echo "$TRACK" | sed 's/\(.\{'$(( MAX_LENGTH % 2 ? MAX_LENGTH - ARTIST_LENGTH - 2 : MAX_LENGTH - ARTIST_LENGTH - 1 ))'\}\).*/\1…/')"

    elif [ $ARTIST_LENGTH -gt $HALF_LENGTH ]; then
      
      ARTIST="$(echo "$ARTIST" | sed 's/\(.\{'$(( MAX_LENGTH % 2 ? MAX_LENGTH - TRACK_LENGTH - 2 : MAX_LENGTH - TRACK_LENGTH - 1 ))'\}\).*/\1…/')"
    fi

    sketchybar  --set $NAME label="${TRACK}  ${ARTIST}" label.drawing=yes icon.padding_right=3 icon.color=0xffa6da95

  elif [ $PLAYER_STATE = "Paused" ]; then
    sketchybar --set $NAME icon.color=0xffeed49f
  elif [ $PLAYER_STATE = "Stopped" ]; then
    sketchybar --set $NAME icon.color=0xffeed49f label.drawing=no icon.padding_right=7
  else
    sketchybar --set $NAME icon.color=0xffeed49f
  fi
}


case "$SENDER" in
  "mouse.clicked") 
    osascript -e 'tell application "Spotify" to playpause'
    ;;
  *)
    update_track
    ;;
esac

