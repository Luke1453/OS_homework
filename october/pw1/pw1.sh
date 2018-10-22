#!/bin/bash
#script that removes the empty lines from a given text file (2 points).

echo please enter filename
read filename

awk NF $filename > placeholder
cat placeholder > $filename
rm placeholder

