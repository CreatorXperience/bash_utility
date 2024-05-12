#!/bin/bash

read -p "Enter the username: " username
read -p "Enter the gooup: " groupname


sudo useradd -m -d /home/$username -s /bin/bash $username
if [[ $? -eq 0 ]];then
	echo "user successfully created..."
else
	echo "couldn't create user"
fi

sudo  groupadd  $groupname
if [[ $? -eq 0 ]];then
	echo "group $groupname is created succcessfully..."
else 
	echo "error creating group"
fi

sudo usermod -aG $groupname $username
if [[ $? -eq 0 ]];then
	echo "$groupname was successfully set on user $username"
else
	echo "couldn't set group on $username"
fi

tail -n 2 /etc/group

