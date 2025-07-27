#!/bin/bash

ID=$(id -u)
TIME_STAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$( echo $0 | cut -d "." -f1)
LOG_FILE=/tmp/$SCRIPT_NAME-$TIME_STAMP.log
echo "please enter DB password:"
read -s mysql_root_password

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $ID -ne 0 ]
then 
    echo -e "$R please login with root user $N"
    exit 1
else
    echo -e "$G you r root user $N"
fi

VALIDATE() {
    if [ $1 -ne 0 ]
    then    
        echo -e "$R error in ...$2 $N "
        exit 1
    else
        echo -e "$G $2 is successfull $N"
    fi
}

dnf install mysql-server -y
VALIDATE $? "installing mysql-server"

systemctl enable mysqld
VALIDATE $? "enabling mysqld"

systemctl start mysqld
VALIDATE $? "starting mysqld"

mysql -h db.daws78s.online -uroot -p${mysql_root_password} -e 'show databases;'
if [ if $? -ne 0 ]
then
    mysql_secure_installation --set-root-pass ${mysql_root_password}
    VALIDATE $? "setting-up root password"
else
    echo -e "MySQL Root password is already setup...$Y SKIPPING $N"
fi


