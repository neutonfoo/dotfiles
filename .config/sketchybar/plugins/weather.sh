#!/usr/bin/env zsh

LOCATION="Singapore"
LOCATION_ESCAPED="Singapore"
WEATHER_JSON=$(curl "wttr.in/$LOCATION_ESCAPED?format=j1")

TEMPERATURE=$(echo $WEATHER_JSON | jq '.current_condition[0].temp_C' | tr -d '"')
WEATHER_DESCRIPTION=$(echo $WEATHER_JSON | jq '.current_condition[0].weatherDesc[0].value' | tr -d '"' | sed 's/\(.\{25\}\).*/\1.../')
MOON_PHASE=$(echo $WEATHER_JSON | jq '.weather[0].astronomy[0].moon_phase' | tr -d '"')

case ${MOON_PHASE} in
  "New Moon")
    ICON=
    ;;
  "Waxing Crescent")
    ICON=
    ;;
  "First Quarter")
    ICON=
    ;;
  "Waxing Gibbous")
    ICON=
    ;;
  "Full Moon")
    ICON=
    ;;
  "Waning Gibbous")
    ICON=
    ;;
  "Last Quarter")
    ICON=
    ;;
  "Waning Crescent")
    ICON=
    ;;
esac

sketchybar --set $NAME label="$LOCATION  $TEMPERATURE糖 $WEATHER_DESCRIPTION"
sketchybar --set $NAME.moon icon=$ICON
