#!/bin/bash

ID=$(id -u)
TIME_STAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE=/tmp/$SCRIPT_NAME-$TIME_STAMP
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $ID -ne 0 ]
then
    echo -e "$R you are not root user $N"
    exit 1
else
    echo -e "$G you'r a root user $N"
fi

VALIDATE (){
    if [ $1 -ne 0 ]
    then
        echo -e "$2...$R FAILURE $N"
        exit 1
    else
        echo -e "$2...$G success $N"
    fi
}

dnf install nginx -y &>>$LOG_FILE
VALIDATE $? "installing nginix"

systemctl enable nginx &>>$LOG_FILE
VALIDATE $? "ENABLING NGINX"

systemctl start nginx &>>$LOG_FILE
VALIDATE $? "starting nginix"

rm -rf /usr/share/nginx/html/* &>>$LOG_FILE
VALIDATE $? "removing html file"

curl -o /tmp/frontend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-frontend-v2.zip &>>$LOG_FILE
VALIDATE $? "downloading application"

cd /usr/share/nginx/html &>>$LOG_FILE
unzip /tmp/frontend.zip &>>$LOG_FILE
VALIDATE $? "unzipping html file"

cp /root/shell_script/expense.conf /etc/nginx/default.d/expense.conf &>>$LOG_FILE
VALIDATE $? "copying expense conf"

systemctl restart nginx &>>$LOG_FILE
VALIDATE $? "Restarting nginx"