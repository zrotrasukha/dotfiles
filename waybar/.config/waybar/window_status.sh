#!/bin/bash
# Check if there are any open windows
windows=$(hyprctl clients -j | jq 'length')

if [ "$windows" -gt 0 ]; then
  # Output the name of the active window if windows are open
  hyprctl activewindow -j | jq -r '.title'
else
  # Output an empty string if no windows are open
  echo ""
fi
