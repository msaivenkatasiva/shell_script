#!/bin/bash

DISK_USAGE=$( df -hT | grep xfs | awk -F " " '{print $6F}' | cut -d "%" -f1)
DISK_THRESHOLD=6
FOLDER=$( df -hT | grep xfs | awk -F " " '{prinf NF}')

WHILE IFS= read -r $line
do
    if [ $DISK_USAGE -ge $DISK_THRESHOLD ]
    then
        echo "$FOLDER is more than $DISK_THRESHOLD, current usage is $DISK_USAGE"
    fi
done <<< $DISK_USAGE