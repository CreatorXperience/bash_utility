#!/bin/bash

var1=""

if [[ -z "$var1" ]];then
  echo "string is empty"
else
  echo "string is not empty"
fi

if [[ -n "$var1" ]];then
  echo 'string is not an empty string'
else
  echo "string is an empty string"
fi
