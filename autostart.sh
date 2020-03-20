#! /bin/bash
#array of games
declare -a GAMES
GAMES[0]="dkong.zip"
GAMES[1]="frogger.zip"
GAMES[2]="galaga.zip"
GAMES[3]="joust.zip"
GAMES[4]="mspacman.zip"
GAMES[5]="pacman.zip"
GAMES[6]="mario.zip"
GAMES[7]="qbert.zip"
GAMES[8]="contra.zip"
GAMES[9]="asteroid.zip"

#random game selection
play=${GAMES[$RANDOM % ${#GAMES[@]} ]}
/opt/retropie/supplementary/runcommand/runcommand.sh 0 _SYS_ "mame-libretro" "$HOME/RetroPie/roms/mame-libretro/$play"
emulationstation #auto