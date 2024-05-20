#!/bin/bash

print_odd (){
for (( i=0; i<50; i++ ));do
	iseven=$(( $i %  2 ));
	if [[ ! $iseven -eq 0 ]];then
	echo "$i"
	fi
done

}

print_odd
