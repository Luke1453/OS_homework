#!/bin/bash
#script that Deletes all specified OU users.

echo ""

read -p "Please specify organisation unit to delete: " ou

if [ -d "/home/students/$ou/" ]; then
	for name in $( ls /home/students/$ou/ ); do
		
		echo Deleting $name
		userdel $name

	done
	rm -fr /home/students/$ou
else
 	echo Organisation unit dosent exist.
fi
echo ""
