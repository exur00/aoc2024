#!/bin/bash

width=$(head -n 1 $1 | wc --chars)
width=$(( width - 1))
height=$(<$1 wc --lines)

#echo "w: $width"
#echo "h: $height"

while ((width > 0)); do
	awk -F '' "BEGIN {f=$width} {printf \$f; f++}" $1 # | tr -d ''
	echo ""
	width=$((width - 1))
done

#echo "main diagonal done"

line=1
while ((line < height)); do
	awk -F '' "BEGIN {waitLines=$line} { if (waitLines-- <= 0) {++f; printf \$f}}" $1
	#echo "$line"
	line=$((line + 1))
	echo ""
done


