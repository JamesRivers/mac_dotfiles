#!/bin/sh
# Command-line world clock

: ${WORLDCLOCK_ZONES:=~/GitFiles/mac_dotfiles/clocks/zones}
: ${WORLDCLOCK_FORMAT:='+%Y-%m-%d %H:%M:%S %Z'}

while read zone
do echo $zone '!' $(TZ=$zone date "$WORLDCLOCK_FORMAT")
done < $WORLDCLOCK_ZONES |
   awk -F '!' '{ printf "%-20s  %s\n", $1, $2;}'

