#!/bin/bash

for fgbg in 38 48 ; do #Foreground/Background
    for color in {0..256} ; do #Colors
        #Display the color
        echo -en "\e[${fgbg};5;${color}m ${fgbg};5;${color}m \t\e[0m"
        #Display 10 colors per lines
        if [ $((($color + 1) % 5)) == 0 ] ; then
            echo #New line
        fi
    done
    echo #New line
done
exit 0
