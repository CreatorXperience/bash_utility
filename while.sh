#!/bin/bash
i=0

while :
do	output="$(pgrep -l $1 | cut -d " " -f 1)"
	if [[ -n  $output ]];then
	echo "Process $output running"
	else
	echo "Process not running" 
  fi
done

