#!/bin/bash
PS3="Select Country: ?"
select COUNTRY in Germany France USA "United Kingdom" Quit

do
  case $REPLY in 
    1) 
      echo "Your country is Germany"
      ;;

    2)
      echo "Your country is France"
      ;;
    3)
      echo "Your country is USA"
      ;;
    4)
      echo "Your country is United Kingdom"
      ;;
    5)
      echo "Quitting"
      sleep 1
      break;
      ;;

    *)
      echo "Invalid option $REPLY"
      ;;
   
    esac


done

