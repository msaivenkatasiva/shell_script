#!/bin/bash

VALIDATE(){
    if [ $1 - ne 0 ]
    then
        echo "error in istalling $2"
        exit 1
    else    
        echo "installing $2 is sucess"
    fi
}


ID=$(id)
if [ $ID -ne 0 ]
then
    echo "your not root user"
    exit 1
else
    echo "you are root user"
fi

yum install nginix -y

VALIDATE $? "echo installing nginix is"