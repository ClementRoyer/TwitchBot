#!/bin/sh
## EPITECH PROJECT, 2019
## 
## File description:
## 
##

source $PWD/../color.sh
source $PWD/../variables.sh 

len=`echo "$1+($1%2)" | bc -q`
run=0
EndTime=`date +"%T"`
EndTime=`echo "$EndTime" | cut -d':' -f3`
EndTime=`echo "($EndTime + 3) % 60" | bc -q`

tput civis
boot_switch=1
printf "[%${len}s]\r["
while [ $run -ne 1 ];
do
    time=`date +"%T"`
    time=`echo "$time" | cut -d':' -f3`
    time=`echo "$EndTime - $time" | bc -l`
    s=`echo "($len / ($time+1))" | bc -q`
    i=0
    random=$(( ( RANDOM % 6 )  + 1 ))
    echo -n "["
    echo -ne "${Color_Tab[${random}]}"
    while [ $i -ne $s ]
    do
	echo -ne "█"
	i=$(( ($i + 1) ))
    done
    echo -ne "\r${COLOR_NONE}"
    if [ $time -eq 0 ];
    then
	run=1
    fi
done
echo -ne "\n${COLOR_NONE}"
tput cnorm
