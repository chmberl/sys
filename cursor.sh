#!/bin/bash

tput clear      # clear the screen
x=3
y=15

tput cup ${x} ${y}   # Move cursor to screen location X,Y (top left is 0,0)

tput setaf 3    # Set a foreground colour using ANSI escape
tput cuu 1             # move cursor up 1 position
tput cud 1
tput cuf 10
tput cub 10
# nudgeup=`tput cuu 2`   # save it for later
# nudgeleft=`tput cub 2`
# echo $nudgeup $nudgeleft
echo "XYX Corp LTD."
tput sgr0
((x = x + 2))
((y = y + 2))
tput cup ${x} ${y}
tput rev        # Set reverse video mode
echo "M A I N - M E N U"
tput sgr0

tput cup 7 15; echo "1. User Management"
tput cup 8 15; echo "2. Service Management"
tput cup 9 15; echo "3. Process Management"
tput cup 10 15; echo "4. Backup"

tput bold       # Set bold mode
tput cup 12 15
read -p "Enter your choice [1-4] " choice

tput clear
tput sgr0
tput rc
