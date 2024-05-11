#!/bin/bash

function printer (){
echo "Printed Something"
}

display () {
  echo "Display something"
}

create_files () {
  echo "Creating files ....."
  sleep 2
  touch $1 && touch $2
  echo "Setting Permission"
  chmod 400 $1
  chmod 400 $2
  echo "Cleaning file..."
  sleep 2
  echo "Setting file"
  sleep 4
  echo "Done..."
  sleep 2
}

function lines_in_grep () {
  grep -c "$1" "$2"
 }

 n="$(lines_in_grep "mem" "/proc/meminfo")"
 echo $n
#create_files $1 $2
printer 
display
