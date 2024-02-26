#! /bin/bash

number='^[+-]?[0-9]+([.][0-9]+)?$' 
if [[ $# != 1 ]] || [[ $1 =~ $number ]];
then 
	printf "Wrong argument\n"
else
	echo $1
fi
