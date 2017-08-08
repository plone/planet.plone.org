#!/bin/bash
# if any command inside script returns error, exit and return that error 
set -e

# This file does:
# Checking for a file called CHANGES.md
# Checks is that file got updated with the latest commit

CHECK_FILE=CHANGES.rst

# If there is no file called CHANGES.md let the test fail.
if [ ! -f "$CHECK_FILE" ]
then
    echo "Can't find CHANHES.md, please check"
    exit 1
else
    if git diff HEAD~ --name-only|grep --quiet $CHECK_FILE; then
        : # Do nothing
    else
    echo "Please update the changelog file"
    echo "Failed!" && exit 1
    fi
fi
exit 0

