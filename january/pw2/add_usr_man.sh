#!/bin/bash
#script that Creates one user account automatically, providing initial information only from the keyboard (14 points).

echo ""

echo Creating user, please enter:
read -p "Name (if user has more than one name, separate them with spaces): " names
read -p "Surname: " surname

pass=linuxPower
group=students

while true; do
    	read -p "Do you wish to enter default organisational unit (PI18E)? y/n: " yn
    	case $yn in
		[Yy] ) ou=PI18E 
			break;;
		[Nn] ) echo "Enter OU name:" 
			read ou
			break;;
		* ) 	echo "Please answer y or n.";;
	esac
done

username="$(echo $names | sed 's/ /-/g').$surname"
#echo $username

if grep -q $group /etc/group
then
	sleep 1
else
	while true; do
   		read -p "Group \"$group\" dosen't exist, proceed to create? y/n: " yn2
		case $yn2 in
        		[Yy] ) groupadd $group 
			break;;
			[Nn] ) exit;; 
			* )    echo "Please answer y or n.";;
		esac
	done
fi

cat /etc/passwd | grep $username >/dev/null 2>&1
	if [ $? = 0 ]
	then
		echo User with username $username already exists. Exiting.
		exit 
	else
		#creation
		
		home_d=/home/students/$ou/$username
		#echo "${home_d}"

		mkdir -p "$home_d"	

		useradd -g $group -d $home_d $username
		echo  "$username:$pass" | chpasswd

		echo added user: $username
	
	fi
echo ""
