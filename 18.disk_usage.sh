#!/bin/bash

DISK_USAGE=$(df -hT | grep xfs)
DISK_THRESHOLD=6
MESSAGE=""


while IFS= read -r line
do
    USAGE=$(echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1)
    FOLDER=$(echo $line | awk -F " " '{print $NF}')
    if [ $USAGE -ge $DISK_THRESHOLD ]
    then
        MESSAGE+="Folder-$FOLDER of your linux server's disk-usage is more than $DISK_THRESHOLD, current usage is $USAGE, please take necessary action on high priority basis \n"
    fi
done <<< $DISK_USAGE

echo -e "Message: $MESSAGE"

echo "$MESSAGE" | mail -s "disk usage alert" ksundar367@gmail.com

#echo "body" mail -s "subject" to-address 