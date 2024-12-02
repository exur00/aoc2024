#!/bin/bash

safe=0

while read line; do
	#echo $(./helper1.bash "$line" "x")
	if [[ $(./helper1.bash "$line" "x") = "safe" ]]; then
		((safe++))
		#echo $safe
	fi	
done < $1

echo $safe
