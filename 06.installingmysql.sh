#!/bin/bash

ID=$(id)

if [ $ID -ne 0 ]
then
    echo "please run the command with root user"
    EXIT 1
else
    echo "you are youser"
fi

yum install mysql -y

if [ $? -ne 0 ]
then 
    echo "error:: installing my sql failed"
    EXIT 1
else
    echo "installing git is sucessfull"
fi

yum install git -y

if [ $? - ne 0 ]
then 
    echo "ERROR:: Installing git is failed"
    EXIT 1
else
    echo "installing git is successfull"
fi