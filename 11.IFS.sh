#!/bin/bash

FILE="/etc/passwd"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ ! $FILE ]
then
    echo -e "$R ERROR:: file $FILE not exist $N"
else
    echo -e "$G found $FILE $G"
fi

while IFS = ":" read -r username password user_id group_id
do 
    echo "username: $username"
    echo "password: $password"
    echo "user_id: $user_id"
    echo "group_id: $group_id"
done < $FILE

