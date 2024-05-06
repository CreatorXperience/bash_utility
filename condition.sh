#!/bin/bash 
if [[ $# -eq 1 ]]
then
  if [[ -f "$1" ]]
  then
    echo "The argument is a file , displaying it's content"
    sleep 1
    cat  $1
  elif [[ -d "$1" ]]
  then 
    echo "The argument is a directory, listing it's content"
    sleep 1
    ls -l $1
  else 
    echo "The argument is neither a file nor a directory"
    sleep 1
  fi
else 
  echo "script should be run with an argument"
fi
