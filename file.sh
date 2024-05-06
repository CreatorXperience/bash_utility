#!/bin/bash

for  item  in  ./*
do
	if [[ -f  "$item" ]];then
	echo "Printing  the content of a $item"
	sleep 1
	cat "$item" 
        echo "###################"
	fi	
done 
