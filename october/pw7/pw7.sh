#!/bin/bash
#script that prints out the list of files in selected directory that are accessed earlier than selected date (2 points).

echo "enter date (format: yyyy-mm-dd) to see that files were accesed earlier"
read date
echo enter path to directory
read dir

find $dir -maxdepth 1 -type f ! -newerat $date


