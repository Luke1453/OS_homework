#!/bin/bash
#script that prints out the hidden non-empty files of selected directory (2 points).

echo enter directory name:
read dir

#find $dir -maxdepth 1 -size +0 -type f -name ".*"
[ -d "$dir" ] && find $dir -maxdepth 1 -size +0 -type f -name ".*" || echo "Error: Directory $dir does not exist."
