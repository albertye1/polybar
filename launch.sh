#!/bin/bash

# Terminate already running bar instances
pkill polybar
# If all your bars have ipc enabled, you can also use
# polybar-msg cmd quit

# Launch Polybar, using default config location ~/.config/polybar/config.ini
polybar first | tee -a /tmp/polybar.log & disown
polybar center | tee -a /tmp/polybar.log & disown
polybar right | tee -a /tmp/polybar.log & disown
# polybar example 2>&1 | tee -a /tmp/polybar.log & disown

echo "Polybar launched..."
