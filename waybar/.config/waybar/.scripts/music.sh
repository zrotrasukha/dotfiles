#!/bin/bash

# Get the current player status and track info
status=$(playerctl status 2>/dev/null)

# Only display if something is playing
if [[ $status == "Playing" || $status == "Paused" ]]; then
  artist=$(playerctl metadata artist 2>/dev/null)
  title=$(playerctl metadata title 2>/dev/null)

  if [[ $status == "Playing" ]]; then
    echo "▶️ $artist - $title"
  else
    echo "⏸️ $artist - $title"
  fi
else
  echo "No music playing"
fi
