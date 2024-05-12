#!/bin/bash
PS3="Your choice: "
select ITEM in "Add User" "List All Processes" "Kill Process" "Install Program" "Remove User"  "Quit"
do
    if [[ $REPLY -eq 1 ]];
    then 
	read -p "Enter the username: " username
	output="$(grep -w $username /etc/passwd)"
	if [[ -n $output ]];
	then 
		echo "The $username already exists"
	else 
		sudo useradd -m -d /home/$username -s /bin/bash -c "From a script"  $username
		if [[ $? -eq 0 ]];then
		echo "the $username was added successfuly"
		tail -n 1 /etc/passwd
		else
		echo "There was an error adding the user"
		fi
	fi
    elif [[ $REPLY -eq 2 ]];then 
	echo "Listen all processes...."
	sleep 1
	ps -ef
   elif [[ $REPLY -eq 3 ]];then
	read -p "Enter the process to kill: " Process
	pkill $process
   elif [[ $REPLY -eq 4 ]];then
	read -p "Enter the program to install: " app
	sudo apt update && sudo apt install $app
	if [[ $? -eq 0 ]];then
	echo "Package was successfully installed"
	else
	echo "Package failed to install"
	fi
   elif [[ $REPLY -eq 5 ]];then
     read -p "User account to remove" username
     userExist="$(grep -w $username /etc/passwd)"
     if [[ -n $userExist ]];then
       sudo userdel -r  $username
       if [[ $? -eq 0 ]];then
          echo "User successfully removed"
        else
          echo "error occured while removing user"
      fi
    else
      echo "user with the specified $username doesn't exist"
    fi
   elif  [[ $REPLY -eq 6 ]];then
	echo "Quiting...."
  sleep 1
	break
	
	
else 
	echo "Invalid menu selection"
fi

done
