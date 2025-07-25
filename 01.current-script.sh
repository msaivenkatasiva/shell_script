#!/bin/bash

COURSE="devops from current script"

echo "before calling other script my course is $COURSE"
echo "my process instance ID is $$"

./02.other-script.sh

echo "my course is $COURSE"
echo "my process instance id is $$"