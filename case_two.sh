#!/bin/bash
#!/bin/bash

echo "$1"
number=$(($1 - 1))
total=0
for int in $number
do
  if [[ $(($number % 3)) -eq 0 ]] -a [[ $(($number % 5)) -eq 0 ]];then
  total=$(($total + $number))
  $number=$(($number-1))
  elif [[ $(($number % 3)) -eq 0 ]] -o [[ $(($number % 5)) -eq 0 ]];then
  total=$(($total + $number))
  $number=$(($number-1))
  elif [[ $number -lt 0 ]];then
  echo "0"
  else
  echo "Whatever"
  fi
done

echo $total
