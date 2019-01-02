#!bin/bash
#Script that Creates user accounts automatically, taking initial information from a text file and keyboard (16 points).
echo ""
echo WARNING: IN PRIVIDED FILE YOU NEED TO SPECIFY IN FIRST LINE HOW MANY USERS YOU NEED TO CREATE AND BEFORE USER DATA HOW MANY NAMES USER HAS!

echo Please enter file with user credentials:
read file

echo Please enter name of Organisational Unit of all users in given file:
read OU

pass="linuxPower"

nrofusers=$(head -n 1 $file)	#how much users to create
nameline=2

group=students

if grep -q $group /etc/group
then
	sleep 1
else
	groupadd $group
fi

for (( i=1; i<=$nrofusers; i++ ))
do
	namecount=$(sed "${nameline}q;d" $file)
	
	if [ $namecount -eq 1 ]
       	then
		readline=$((nameline+1))
		readsurname=$((nameline+2))
		username="$(sed "${readline}q;d" $file).$(sed "${readsurname}q;d" $file)"

		nameline=$((nameline+3))
	fi

	if [ $namecount -eq 2 ]
       	then 
		readline=$((nameline+1))
		readline1=$((nameline+2))
		readsurname=$((nameline+3))
		username="$(sed "${readline}q;d" $file)-$(sed "${readline1}q;d" $file).$(sed "${readsurname}q;d" $file)"

		nameline=$((nameline+4))
	fi

#	echo $username
	
	cat /etc/passwd | grep $username >/dev/null 2>&1
	if [ $? = 0 ]
	then
		echo User $username already exists. Skipping.
		continue
	else
		#creation
		
		home_d=/home/students/$OU/$username
#		echo "${home_d}"

		mkdir -p "$home_d"	

		useradd -g $group -d $home_d $username
		echo -e "$pass\n$pass\n" | passwd $username

		echo added user: $username

	fi

done
	


