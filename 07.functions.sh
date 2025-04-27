#!/bin/bash

VALIDATE(){
    if [ $1 - ne 0 ]
    then
        echo "error::.... $2 failed"
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

yum install mysql -y

VALIDATE $? "installing nginix"