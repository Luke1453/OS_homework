#!/bin/bash
#script that finds the longest line in a text file and prints out the line number and the line itself (2 points).

echo input filename
read filename

max_num=0
max_line=""
count=0
while read -r line
do
	
	old_line=${#max_line}
	new_line=${#line}
 	count=$((count + 1 )) 
	if [ "$old_line" -lt "$new_line" ]
	then	
		max_num=$count
		max_line=$line
	fi	
		
done < "$filename"

echo Line number: $max_num
echo $max_line
