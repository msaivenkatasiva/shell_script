#!/bin/bash

COURSE="DevOps from current script"

echo "before calling other script, course is $COURSE"
echo "process id of current shell script: $$"

#./16.other-script.sh
source ./16.other-script.sh

echo "after calling other script $COURSE"