#!/bin/bash

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"
VALIDATE(){
    if [ $1 -ne 0 ]
    then    
        echo "error::....installing $2 failed"
        exit 1
    else
        echo " $2 success"
    fi
}

ID=$(id)
if [ $ID -ne 0 ]
then 
    echo "please run the command with root user"
    exit 1
else    
    echo "you are root user"
fi

yum install git -y &>> $LOGFILE

VALIDATE $? "installing git"
