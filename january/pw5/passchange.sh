#!/bin/bash
#script that resets user pasword to "linuxPower"
echo ""
read -p "Please enter username to reset pasword: " username

pass=linuxPower

 cat /etc/passwd | grep $username >/dev/null 2>&1
	if [ $? = 0 ]
	then
		echo "$username:$pass" | chpasswd
	else
		echo User dosent exist, nothing to change.
	fi

echo ""
