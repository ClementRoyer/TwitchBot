#!/bin/sh
## EPITECH PROJECT, 2019
## 
## File description:
## 
##

source $PWD/log.sh
dictionnary=([0]=null [1]=join [2]=host [3]=comment_from_serv)
USERL=`echo "$USER_T" | tr '[:upper:]' '[:lower:]'`
LOG_SUCCESS=`echo -e ':tmi.twitch.tv 001 '$USERL' :Welcome, GLHF!\r'`

function join() {
    echo -en "\e[91mConnection : ..\e[0m"
}

function host() {
    echo -e "\r\e[92mConnection : OK\e[0m"
}

function comment_from_serv() {
    echo -n ""
}

function useless() {
    echo -n ""
}

function CAP() {
    echo -n ""
}

function JOIN() {
    echo -e "\e[92mYou have join the channel of \e[92;1m$CHANNEL\e[0m"
}

function MODE() {
    name=`echo "$command_text" | awk '{ print $NF }'`
    echo -e "\e[33mModeretor: \e[33;2m$name\e[0m"
}

function PRIVMSG() {
    txt=`echo "${cmd_r%%!*}"`
    echo -e "\e[38;5;11m[${txt:1}]\t\e[91;0m - \e[92;1m$command_text\e[0m"
}


while true; do
    read cmd_r
    command_text=`echo "$cmd_r" | sed 's/:[^:]*://'`
    flag=`echo "$cmd_r" | cut -d' ' -f 2`
    flag_num=`echo "$flag" | bc -l`
    use=${dictionnary[$flag_num]}

    if [ ${#use} -ne 0 ]
    then
	$use
    else
	if [ ${#flag} -ne 3 ]
	then
	    $flag
	else
	    useless
	fi
    fi
done
