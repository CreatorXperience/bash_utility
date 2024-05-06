#!/bin/bash

output="$(ping -c 3 $1)"
if [[ "$output" == *"100% packet loss"* ]]
then
  echo "$1 is unreachable"
elif [[ "$output" == *"Network is"* ]];then
  echo "You don't have access to this network"
else 
  echo "all packet lost"

fi
