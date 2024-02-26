#!/bin/bash

echo
i=0
parameters=($@)
for location in "1 background" "1 font color" "2 background" "2 font color"; do
    echo -n "Column $location = "
    case "${parameters[$i]}" in
        "default_1" )
        echo -n "default"
        ;;
        "default_2" )
        echo -n "default"
        ;;
        "default_3" )
        echo -n "default"
        ;;
        "default_4" )
        echo -n "default"
        ;;
        "1" )
        echo -n "1"
        ;;
        "2" )
        echo -n "2"
        ;;
        "3" )
        echo -n "3"
        ;;
        "4" )
        echo -n "4"
        ;;
        "5" )
        echo -n "5"
        ;;
        "6" )
        echo -n "6"
        ;;
    esac
    
    echo -n " ("
    case "${parameters[$i]}" in
        "default_1" )
        echo -n "white"
        ;;
        "default_2" )
        echo -n "red"
        ;;
        "default_3" )
        echo -n "green"
        ;;
        "default_4" )
        echo -n "black"
        ;;
        "1" )
        echo -n "white"
        ;;
        "2" )
        echo -n "red"
        ;;
        "3" )
        echo -n "green"
        ;;
        "4" )
        echo -n "blue"
        ;;
        "5" )
        echo -n "purple"
        ;;
        "6" )
        echo -n "black"
        ;;
    esac
    echo ")"
    i=$(( $i + 1 ))
done