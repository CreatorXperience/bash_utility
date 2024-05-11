#!/bin/bash

if (( $1 != $2 ));then
	echo "not equal" 
else
	echo "equal"
fi



for (( i = 0; i < $#; i++ ));do 
  echo "$i"
done

for item in $*;do
  echo $item
done
