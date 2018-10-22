#!/bin/bash
#script that removes all empty files in a whole directory tree. Root of the tree is entered from the keyboard (2 points).

echo please enter root of the directory from which to start deleting empty files.
read dir

find $dir -empty -type f -delete 
