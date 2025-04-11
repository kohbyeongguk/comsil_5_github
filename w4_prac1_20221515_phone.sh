#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: phone searchfor [...searchfor]"
    echo "(you didn't tell me what you want to search for.)"
    exit 1
fi


pattern=""
for arg in "$@"
do
    if [ -z "$pattern" ]; then
        pattern="$arg"
    else
        pattern="$pattern|$arg"
    fi
done


egrep -i "($pattern)" $HOME/mydata.txt > tmp
awk -f display.awk tmp
rm tmp
