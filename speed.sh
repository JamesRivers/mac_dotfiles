#!/bin/zsh
#Speedtest review

function speedtest ()
{
echo "I am running a speed test, please wait a few seconds"
/opt/homebrew/bin/speedtest
}
export -f speedtest
clear 
while true;
do 
      speedtest;
      sleep 1;
         clear
      done
      
