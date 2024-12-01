#!/bin/bash

awk -F '   ' '{print $1}' input.txt > col1
awk -F '   ' '{print $2}' input.txt > col2

sum=0

while read one <&3; do
	occ=$(grep "$one" col2 | wc -l)
	sum=$(( sum + (occ * one)))
done 3<col1
echo "$sum"
