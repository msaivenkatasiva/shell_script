#!/bin/bash

NUMBER=$1
DATE=$(date)

echo "the statement is delivered at $DATE"

if [ $NUMBER is -gt 100 ]
    echo "given $NUMBER is greater than 100"
else
    echo "given $NUMBER is less than 100"
fi