#!/in/bash
#Write a script that prints out the largest directory measured in amount of simple files of user‘s home directory (2 points).

echo "how much unique files | path to directory with files"

find $HOME -type f -printf '%h\n' | sort | uniq -c | sort | tail -n 1
