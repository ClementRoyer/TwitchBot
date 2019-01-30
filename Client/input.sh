#!/bin/sh
## EPITECH PROJECT, 2019
## 
## Clément ROYER
## clement.royer@epitech.eu

source $PWD/log.sh
./printlog.sh
while read line ; do
      echo "$line" | sed "s/^/PRIVMSG #$CHANNEL :/"
done
