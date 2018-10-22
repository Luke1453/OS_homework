#!/bin/bash
#Write a script that prints out the list of files in a directory tree that are larger in size, measured in bytes, than the given size (2 points).

echo enter directory path
read dir
echo enter file size in bytes
read size

size="${size}c"

find $dir -type f -size +$size
