#!/bin/bash

isterminatorup="$(pgrep terminator)"

if [[ -n $isterminatorup ]];then
	echo "terminator is already running"
else
  DISPLAY=:0
  XAUTHORITY="/run/user/1000/gdm/Xauthority"
  DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY terminator & 
	echo "terminator opened successfully"
fi

