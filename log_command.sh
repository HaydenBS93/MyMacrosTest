#!/bin/bash

# Navigate to the repository
cd /root/MyMacrosTest || exit

# Log the command and its timestamp
echo "[$(date)] $*" >> command_log.txt

# Stage the changes
git add command_log.txt

# Commit the changes with the command as the message
git commit -m "Ran command: $*"

# Push the changes to the repository
git push origin master
