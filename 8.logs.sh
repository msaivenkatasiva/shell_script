#!/bin/bash

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then    
        echo "error::....installing $2 failed"
        exit 1
    else
        echo "$G $2 success"
    fi
}

ID=$(id)
if [ $ID -ne 0 ]
then 
    echo "please run the command with root user"
    exit 1
else    
    echo "$Y you are root user"
fi

yum install git -y &>> $LOGFILE

VALIDATE $? "installing git"
