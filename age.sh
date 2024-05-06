#!/bin/bash
read -p "Input your age: " age

if [[ $age -gt 20 ]]
then 
  echo "You are Major"
  chmod +x $1
elif [[ $age -lt 20 ]]
then
  echo "You are a Minor"
else 
  echo "Well you are a Major..."

fi
