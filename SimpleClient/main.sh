#!/bin/sh
# Copyright 2018 <clement.royer@epitech.eu>

NICK="YOURTWITCHNAME"
PASS="oauth:URETOKEN"
SERVER=irc.twitch.tv
PORT=6667
CHAN="YHE TWITCH CHANNEL IN LOWERCASE"

{
  cat << IRC
PASS $PASS
NICK $NICK
USER $NICK
JOIN $CHAN
IRC

  while read line ; do
      echo "$line" | sed "s/^/PRIVMSG #$CHAN :/"
  done
  
} | nc $SERVER $PORT | while read line ; do
  case "$line" in
    *PRIVMSG\ $CHAN\ :*) echo "$line" | cut -d: -f3- ;;
  esac
done
