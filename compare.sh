#!/bin/bash

read -p "Input password: " -s pass

read -p "Confirm password: " -s conpass

if [ "$pass" = "$conpass" ]
then 
  echo "Password changed successfully"

else 
  echo "Password Mismatch"

fi

if [[ "$pass" == "$conpass" ]]
then 
  echo "Password Changed successfully"
else
echo "Password not changed"
fi

if [[ "$pass" != "$conpass" ]];then
  echo "Password not equal"
fi
