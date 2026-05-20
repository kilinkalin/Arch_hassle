#!/bin/bash

vol() {
    pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+%' | head -1
}

title=$(playerctl metadata title 2>/dev/null || echo "Ei musiikkia")
artist=$(playerctl metadata artist 2>/dev/null || echo "")

yad --title="Player" \
    --text="🎵 $title - $artist\n🔊 $(vol)" \
    --on-top \
    --skip-taskbar \
    --width=300 \
    --button="⏮:bash -c 'playerctl previous'" \
    --button="⏸/▶:bash -c 'playerctl play-pause'" \
    --button="⏭:bash -c 'playerctl next'" \
    --button="🔉:bash -c 'pactl set-sink-volume @DEFAULT_SINK@ -5%'" \
    --button="🔊:bash -c 'pactl set-sink-volume @DEFAULT_SINK@ +5%'" \
    --button="🔇:bash -c 'pactl set-sink-mute @DEFAULT_SINK@ toggle'"
