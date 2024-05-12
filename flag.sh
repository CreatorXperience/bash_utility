#!/bin/bash

_1=${1:-ifconfig}
output="$($_1)"
flag="$2"

if [[ $output == *$flag* ]];then
	echo "found flag $flag in $_1"
else
	echo "Couldn't find $flag in $_1"
fi


