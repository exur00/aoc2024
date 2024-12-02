#!/bin/bash

input="$1"
dir="$2"
#echo "$input"

first=$(echo "$input" | awk -F ' ' '{print $1}')
rest=$(echo "$input" | sed "s/${first}//")
next=$(echo "$rest" | awk -F ' ' '{print $1}')

if [ -n "$next" ]; then
	dif=$((next - first))
	if [ "$dif" = "0" ]; then
		echo "unsafe"
	else
		difAbs=${dif/#-}
		newDir=$((dif/difAbs))
		if (( difAbs > 3)) ; then
			echo "unsafe"
		elif [ "x" = "$dir" ]; then
			./helper1.bash "$rest" "$newDir"
		elif (((dir * newDir) < 0)) ;then
			echo "unsafe"
		else 
			./helper1.bash "$rest" "$newDir"
		fi
	fi
else
	echo "safe"
fi


