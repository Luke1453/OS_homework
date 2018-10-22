#!/bin/bash
#script that prints out the files of selected directory, having only "read" permission (2 points).

echo enter directory path
read dir

find $dir -maxdepth 1 -type f -perm 444    
