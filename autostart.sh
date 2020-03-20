#! /bin/bash

declare -a GAMES

for file in /home/pi/RetroPie/roms/mame-libretro/*.zip
do
    GAMES=("${GAMES[@]}" "${file##*/}")
done

#random game selection
play=${GAMES[$RANDOM % ${#GAMES[@]} ]}
/opt/retropie/supplementary/runcommand/runcommand.sh 0 _SYS_ "mame-libretro" "$HOME/RetroPie/roms/mame-libretro/$play"

#start emulation after hotkey breakout of the game that was autoloaded
emulationstation #auto