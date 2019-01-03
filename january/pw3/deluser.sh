#!bin/bash
#script that deletes user
echo ""
read -p "Please enter user name to delete: " username

homedir=$(eval echo ~$username)
#echo $homedir

cat /etc/passwd | grep $username >/dev/null 2>&1
	if [ $? = 0 ]
	then
		userdel $username
		rm -fr $homedir
	else
		echo User dosent exist, nothing to delete.
	fi

echo ""
