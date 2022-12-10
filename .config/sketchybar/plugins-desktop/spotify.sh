#!/usr/bin/env sh

# Max number of characters so it fits nicely to the right of the notch
# MAY NOT WORK WITH NON-ENGLISH CHARACTERS

MAX_LENGTH=100
# MAX_LENGTH=45

# Logic starts here, do not modify
HALF_LENGTH=$(((MAX_LENGTH + 1) / 2))

# Spotify JSON / $INFO comes in malformed, line below sanitizes it

# SPOTIFY_JSON="{$(echo $INFO | iconv -f utf-8 -t utf-8 -c | cut -d'}' -f1 | cut -d'{' -f2)}"
SPOTIFY_JSON="$INFO"

update_track() {
  PLAYER_STATE=$(echo "$SPOTIFY_JSON" | jq -r '.["Player State"]')

  if [[ -z $PLAYER_STATE || $PLAYER_STATE = "Stopped" ]]; then
    # If not playing / stopped
    sketchybar --set $NAME background.color=0xffeed49f label.drawing=no icon.padding_right=7
  elif [ $PLAYER_STATE = "Playing" ]; then
    # If playing
    TRACK="$(echo "$SPOTIFY_JSON" | jq -r .Name)"
    ARTIST="$(echo "$SPOTIFY_JSON" | jq -r .Artist)"

    # Calculations so it fits nicely

    TRACK_LENGTH=${#TRACK}
    ARTIST_LENGTH=${#ARTIST}

    if [ $(( TRACK_LENGTH + ARTIST_LENGTH )) -gt $MAX_LENGTH ]; then 
      # If the total length exceeds the max
      if [ $TRACK_LENGTH -gt $HALF_LENGTH ] && [ $ARTIST_LENGTH -gt $HALF_LENGTH ]; then
        # If both the track and artist are too long, cut both at half length - 1
        
        # If MAX_LENGTH is odd, HALF_LENGTH is calculated with an extra space, so give it an extra char
        TRACK="${TRACK:0:$(( MAX_LENGTH % 2 == 0 ? HALF_LENGTH - 2 : HALF_LENGTH - 1 ))}…"
        ARTIST="${ARTIST:0:$(( HALF_LENGTH - 2 ))}…"

      elif [ $TRACK_LENGTH -gt $HALF_LENGTH ]; then
        # Else if only the track is too long, cut it by the difference of the max length and artist length
        TRACK="${TRACK:0:$(( MAX_LENGTH - ARTIST_LENGTH - 1 ))}…"
      elif [ $ARTIST_LENGTH -gt $HALF_LENGTH ]; then
        ARTIST="${ARTIST:0:$(( MAX_LENGTH - TRACK_LENGTH - 1 ))}…"
      fi
    fi
    sketchybar  --set $NAME label="${TRACK}  ${ARTIST}" label.drawing=yes icon.padding_right=3 background.color=0xffa6da95

  elif [ $PLAYER_STATE = "Paused" ]; then
    # If paused (can only get to from Playing)
    sketchybar --set $NAME background.color=0xffeed49f
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

