#!/usr/bin/env bash

source './functions.sh'
menu
loop=0
while [[ $loop -eq 0 ]]; do

echo -e "menu: \n"
echo -e "1: Download Single File"
echo -e "2: Download List File \n"

read -p "Enter your option: " Option

if [[ Option -eq 1 ]]; then
  downloadSingle
elif [[ Option -eq 2 ]]; then
  downloadList
elif [[ $num -eq 3 ]]; then
loop=1
exit
fi

done
