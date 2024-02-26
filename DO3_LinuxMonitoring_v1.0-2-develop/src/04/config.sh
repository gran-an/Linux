#!/bin/bash

    parameter_1=$(cat config.conf | grep "column1_background=" | cut -c 20)
    parameter_2=$(cat config.conf | grep "column1_font_color=" | cut -c 20)
    parameter_3=$(cat config.conf | grep "column2_background=" | cut -c 20)
    parameter_4=$(cat config.conf | grep "column2_font_color=" | cut -c 20)

if ! [[ $parameter_1 =~ [1-6] ]]; then
    parameter_1="default_1"
    if [[ "$parameter_2" == "1" ]]; then
        echo "Error"
        exit
    fi
fi

if ! [[ $parameter_2 =~ [1-6] ]]; then
    parameter_2="default_2"
    if [[ $parameter_1 == "2" ]]; then
        echo "Error"
        exit
    fi
fi

if ! [[ $parameter_3 =~ [1-6] ]]; then
    parameter_3="default_3"
    if [[ $parameter_4 == "3" ]]; then
        echo "Error"
        exit
    fi
fi

if ! [[ $parameter_4 =~ [1-6] ]]; then
    parameter_4="default_4"
    if [[ $parameter_3 == "6" ]]; then
        echo "Error"
        exit
    fi
fi

if [[ ("$parameter_1" == "$parameter_2" || "$parameter_3" == "$parameter_4") ]]; then
    exit
fi
echo $parameter_1 $parameter_2 $parameter_3 $parameter_4
