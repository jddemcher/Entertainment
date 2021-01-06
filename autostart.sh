#! /bin/bash
# this script can be configured to run in the location:
#
#     /opt/retropie/configs/all/autostart.sh
#
# I developed this script to auto start a game randomly in a given location, this one specifically
# runs any of my MAME roms
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