#!/bin/bash

title=$(playerctl metadata title 2>/dev/null)
artist=$(playerctl metadata artist 2>/dev/null)
status=$(playerctl status 2>/dev/null)

if [ "$status" = "Playing" ]; then
    pause_label="⏸ Pause"
else
    pause_label="▶ Play"
fi

choice=$(echo -e "⏮ Edellinen\n$pause_label\n⏭ Seuraava\n🎵 $title - $artist" | rofi -dmenu -p "Player")

case "$choice" in
    "⏮ Edellinen") playerctl previous ;;
    "⏸ Pause") playerctl pause ;;
    "▶ Play") playerctl play ;;
    "⏭ Seuraava") playerctl next ;;
esac
