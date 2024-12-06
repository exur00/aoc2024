#!/bin/bash

search="XMAS"
tac $1 > reverse

result=$(cat $1 | grep -o "$search" | wc -l)
result=$((result + $(./transpose.bash $1| grep -o "$search" | wc -l)))
result=$((result + $(./diagonal.bash $1 | grep -o "$search" | wc -l)))
# mirror and diagonal!
result=$((result + $(./diagonal.bash reverse | grep -o "$search" | wc -l)))

search=$(echo "$search" | rev)

result=$((result + $(cat $1 | grep -o "$search" | wc -l)))
result=$((result + $(./transpose.bash $1| grep -o "$search" | wc -l)))
result=$((result + $(./diagonal.bash $1 | grep -o "$search" | wc -l)))
# mirror and diagonal!
result=$((result + $(./diagonal.bash reverse | grep -o "$search" | wc -l)))

echo $result
