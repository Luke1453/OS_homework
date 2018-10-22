#!/bin/bash
#script that removes all empty files and directories in a given directory and prints out the list of deleted items, including the type of deleted item, i.e. directory or file, and last access time (4 points).
# works in current (.) directory

echo please enter a directory path
read dir

for i in $(find $dir -maxdepth 1 -empty -print );
do

	stat $i --printf "Deleting file: %n Format: %F Last_access: %x\n" 
	rm $i -d	

done
