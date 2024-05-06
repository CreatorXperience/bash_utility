#!/bin/bash
for  item  in *.txt
do
	mv "$item" "renamed_by_scripts_$item"
done
