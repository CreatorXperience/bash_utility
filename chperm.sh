#!/bin/bash

read -p "Directory name: " _dirname

for item in $_dirname/*
do
	if [[ -d $item ]];then
		echo "setting permission 755  for $item"
		sudo chmod 755 $item
	elif [[ -f $item ]];then
		echo "setting permission 644 for $item"
		sudo  chmod 644 $item
	fi
done
echo "Directory or filename within $_dirname permission is successully set to 756 and 644 respectively"
tree -p $_dirname

