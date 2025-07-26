#!/bin/bash

DISK_USAGE=$( df -hT | grep xfs )
DISK_THRESHOLD=6


while IFS= read -r line
do
    USAGE=$( echo $line | awk -F " " '{print $6F}' | cut -d "%" -f1 )
    FOLDER=$( echo $line | df -hT | grep xfs | awk -F " " '{prinf NF}')
    if [ $DISK_USAGE -ge $DISK_THRESHOLD ]
    then
        echo "$FOLDER is more than $DISK_THRESHOLD, current usage is $USAGE"
    fi
done <<< $USAGE