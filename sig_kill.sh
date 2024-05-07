#!/bin/bash
if [[ $# -ne 2 ]]; then
echo "argument must be exactly 2, signal and process ids"
fi
case $1 in 
 	1)
	sudo kill -SIGHUP $2	
	echo "Hangup $2"
	;;
	
	2) 
	sudo kill -SIGINT $2
	echo "interrupt $2"
	;;

	15)
	sudo kill -SIGKILL $2
	echo "kill $2"
	;;
	
	*)
	echo "signal to $3 wasn't delivered"
	;;
esac
