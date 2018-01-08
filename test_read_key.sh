#!/bin/bash

while [[ 1 ]]
do
    read -s -n 1 key
    key=`echo $key | cat -v`
    echo $key
done
