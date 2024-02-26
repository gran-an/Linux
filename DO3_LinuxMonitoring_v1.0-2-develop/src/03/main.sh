#! /bin/bash

if ! [ $# -eq 4 ]; then
echo "Enter 4 arguments"
else
for parameter in "$@"; do
if ! [[ $parameter =~ [1-6] ]]; then
echo "Incorrect arguments. Range of argument values 1-6."
exit
fi
done

if [[ "$1" == "$2" || "$3" == "$4" ]]; then
echo "The first argument should be different from the second and the third argument should be different from the fourth."
else
Color=$(bash ./colors.sh $@)
bash ./output.sh $Color
fi
fi