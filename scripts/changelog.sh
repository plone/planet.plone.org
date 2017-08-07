#!/bin/bash

# This file does:
# Checking for a file called CHANGES.md
# Checks is that file got updated with the latest commit

CHECK_FILE=CHANGES.md

if [ -f "$CHECK_FILE" ]
then
    if git diff --cached --name-only | if grep --quiet "$CHECK_FILE"
    then
        echo "No Changes"
        exit 1
else
    echo the file does not exist
    exit 1
fi
exit 0
