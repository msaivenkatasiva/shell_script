#!/bin/bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

VARIABLE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 .....$R failed $N"
        exit 1
    else
        echo -e "$2......$G SUCCESS $N"
    fi
}

if [ $ID -ne 0 ]
then    
    echo -e "$R error:: you are not a root user $N"
    exit 1
else
    echo -e "$G you are root user $N"
fi

for package in $@
do
    yum list installed $package &>> $LOGFILE
    if [ $? -ne 0 ]
    then
        yum install $package &>> $LOGFILE
        VALIDATE $? "installation od $package"
    else
        echo -e "$package is alread installed....$Y skipping $N "
    fi
done