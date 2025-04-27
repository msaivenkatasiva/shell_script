#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

NUMBER1=$1
NUMBER2=$2
DATE=$(date)

echo "the sum executed at $G $DATE $N"
SUM=$(($NUMBER1+$NUMBER2))
echo "total amount is $R $SUM $N"  