#!/bin/bash

if [[ $# -eq 1 ]];then
    if [[ -e $1 ]] && [[ -d $1 ]] && [[ "${1: -1}" == "/" ]];then
        . ./information.sh
        START=`cat /proc/uptime | awk '{print $1}'`
        total_folders $1
        top_5_folders $1
        type_files $1
        top_10_files $1
        top_10_exe_files $1
        STOP=`cat /proc/uptime | awk '{print $1}'`
        RESULT=`echo $STOP - $START | bc`
        echo "Script execution time (in seconds) = $RESULT"
    else
        echo "Wrong! There is no such way"
    fi
else
    echo "Wrong! The script runs like this, for example ./main.sh /var/log/"
fi