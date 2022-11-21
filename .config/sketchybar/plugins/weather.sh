#!/usr/bin/env zsh

LOCATION="Singapore"
LOCATION_ESCAPED="Singapore"
WEATHER_JSON=$(curl "https://wttr.in/$LOCATION_ESCAPED?format=j1")

# Fallback if empty
if [ -z $WEATHER_JSON ]; then

  sketchybar --set $NAME label=$LOCATION
  sketchybar --set $NAME.moon icon=
  
  return
fi

echo "HERE"

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

# WEATHER_CODE=$(echo $WEATHER_JSON | jq '.current_condition[0].weatherCode' | tr -d '"')
#
# case $WEATHER_CODE in
#   116) # Partly cloudy
#     WEATHER_ICON=
#     ;;
#   *)
#     WEATHER_ICON=
#     ;;
# esac
#
# echo "WEATHER CODE $WEATHER_CODE"

sketchybar --set $NAME label="$LOCATION  $TEMPERATURE糖 $WEATHER_DESCRIPTION"
sketchybar --set $NAME.moon icon=$ICON
