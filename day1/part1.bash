#!/bin/bash

awk -F '   ' '{print $1}' input.txt > col1
awk -F '   ' '{print $2}' input.txt > col2

sort col1 -o col1s
sort col2 -o col2s

sum=0

while read one <&3 && read two <&4; do
	dist=$((two - one))
	dist=${dist/#-}
	sum=$((sum + dist))
	
done 3<col1s 4<col2s
echo "$sum"
