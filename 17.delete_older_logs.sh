#!/bin/bash

SOURCE_FILE=/tmp/app-logs

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ -d $SOURCE_FILE ]
then
    echo -e "$G your source file exists $N"
else
    echo -e "$R your source file: $SOURCE_FILE doesn't exists $N"
fi

$FILES=$(find $SOURCE_FILE -name "*.log" -mtime +14)

while read -r line
do
    echo -e "$R deleting file:$N $line"
    rm -rf $line
done <<< $FILES