#!/bin/bash
# Grab the page source from bbc iplayer save to a file called episodes
#�| change text value as required below
edit=episodes_edit
cat episodes | grep -E -o "b0074.{0,3}" episodes | sort -u > $edit
url=https://www.bbc.co.uk/iplayer/episode/
sed -i "s+^+$url+g" $edit
