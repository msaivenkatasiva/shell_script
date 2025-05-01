#!/bin/bash

SOURCE_DIR="/tmp/shell-script.logs"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

FILES_TO_DELETE=$(find $SOURCE_DIR -type f -mtime +14 -name "*.log")

if [ ! -d $SOURCE_DIR ]
then
    echo -e "$R error:: SOURCE DIRECTORY doesn't exist $N"
fi

while IFS=read -r line
do
    echo "deleting files: $line"
    rm -rf
done <<< $FILES_TO_DELETE
