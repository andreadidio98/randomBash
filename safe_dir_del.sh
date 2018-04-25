#!/bin/bash
#Simple script to avoid deleting by accident entire directories

LOCATION=$1
FILECOUNT=0;
DIRCOUNT=0

if [ "$#" -lt "1" ]
then
	echo "Usage: safe_dir_del.sh <directory_to_delete>"
	exit 0
fi

for item in $LOCATION/*
do
if [ -f "$item" ]
	then
		FILECOUNT=$[$FILECOUNT + 1]
elif [ -d "$item" ]
	then
		DIRCOUNT=$[$DIRCOUNT + 1]
fi
done

echo "There are $FILECOUNT files in the directory to be deleted"
echo "There are $DIRCOUNT diretories in the directory to be deleted"

read -p "Are you sure you want to delete $(($FILECOUNT + $DIRCOUNT)) items? (y/n) " -n 1 -r
echo #newline
if [[ $REPLY =~ ^[Yy]$ ]]
	then
		rm -rf $LOCATION
fi
