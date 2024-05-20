#!/bin/bash

isterminatorup="$(pgrep terminator)"

if [[ -n $isterminatorup ]];then
	echo "terminator is up"
else
	echo "terminator is down"
  cd ~
  $(terminator)
fi

