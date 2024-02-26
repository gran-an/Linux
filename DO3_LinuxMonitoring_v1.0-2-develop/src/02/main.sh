#! /bin/bash

if [ $1 ]
then
echo "Arguments are not needed"
exit
else
. ./output.sh
echo -n "Wish to write this in a file? (Y/N)"
read Answer
if [ "$Answer" = "Y" ] || [ "$Answer" = "y" ]
then
Filename=$(date +"%d_%m_%y_%H_%M_%S")
bash ./output.sh > ./"$Filename.status"
echo "File saved in the current directory."
else
echo "File not saved."
fi
fi