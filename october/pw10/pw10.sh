#!/bin/bash
#Write a script – address book with functionalities such as follows:

#    New record insertion (name, surname, phone no., e-mail) (2 points)
#    Record search (1 point)
#    List of all records (1 point)
#    Record removal (2 points)

path="${HOME}/.pw10_storage"

if [ -d $path ] 
then
	clear	

	echo "What do you want to do?"
	echo "Add a new record?_________________________Press 'a' and enter."
	echo "Search records?___________________________Press 's' and enter."
	echo "List all records?_________________________Press 'l' and enter."
	echo "Remove a record?__________________________Press 'r' and enter."
	echo "Remove directory with all records?________Enter 'rd' and enter."
	echo "Exit script?______________________________Press 'x' and enter."
	read sel
	echo	

	case $sel in
#adding a new record----------------------------------------------------------------------------------------------------
		a)
		echo WARNING: IF YOU ENTER EXISTING CONTACT NAME AND SURNAME YOU WILL UPDATE ITS PHONE# AND EMAIL!
		echo
		echo Enter contacts name:
		read name
		echo Enter contacts surname:
		read surname
		echo Enter contacts phone number:
		read num
		echo Enter contacts email:
		read email

		filename="${path}/${name}_$surname.txt"		
		
		echo "Name:		$name" > $filename
		echo "Surname:	$surname" >> $filename
		echo "Phone#:		$num" >> $filename
		echo "Email:		$email" >> $filename
		echo >>$filename
		;;

#searching records----------------------------------------------------------------------------------------------------------

		s)
		echo To search records please enter
		printf "Name: "
		read name1
		printf "Surname: "
		read surname1
		echo
		filename1="${path}/${name1}_$surname1.txt"

		if [ -f $filename1 ]
		then
			cat $filename1
		else 
			echo There is no contact named $name1 $surname1.
		fi
		;;
		
#listing all records-------------------------------------------------------------------------------------------------------
		l)
		#echo $(expr $(ls $path -l | wc -l) - 1)
		catfiles="${path}/*.txt"
		cat $catfiles
		;;
#removing one record-------------------------------------------------------------------------------------------------------
		r)
		echo To remove a contact please enter
		printf "Name:"
		read name2
		printf "Surname:"
		read surname2
		echo
		filename2="${path}/${name2}_$surname2.txt"

		if [ -f $filename2 ]
		then
			rm $filename2
		else
			echo Imposible to delete contact named $name2 $surname2, it dosent exist.
		fi
		;;
#removing entire directory (rd selection)-----------------------------------------------------------------------------------
		
		rd)
		rm -r $path
		;;
		
#exiting script-------------------------------------------------------------------------------------------------------------
	
		x)
		exit
		;;

#invalid option response-------------------------------------------------------------------------------------------------------
		*)
		echo Invalid option;;
	esac
#asking to make storege directory when launching first time---------------------------------------------------------------------

else
	echo "Do you want to make a directory named .pw10_storage/ in your home folder to store adressbook entries? y/n"
	read res1
	
	case $res1 in 
		y)
		mkdir $path
		;;
		n)
		exit
		;;
		*)
		echo Invalid option
		;;
	esac
fi
