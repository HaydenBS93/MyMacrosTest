#!/bin/bash

# Define the repository path
REPO_PATH="/root/MyMacrosTest"

# Navigate to the repository
cd "$REPO_PATH" || { echo "Repository not found: $REPO_PATH"; exit 1; }

# Ensure tracking of configuration files
sudo cp /etc/nginx/sites-enabled/default ./nginx-config/default  # Adjust if needed
sudo cp -r /var/www/html/* ./www-html/  # Backup web files

# Ensure both a commit message and a description are passed
if [ -z "$1" ]; then
    echo "Usage: $0 <commit-title> <commit-description>"
    exit 1
fi

# Get the title and description from arguments
COMMIT_TITLE="$1"
shift  # Shift the arguments to make room for the description
COMMIT_DESCRIPTION="$*"

# Log the commit title and description with timestamp
LOG_FILE="command_log.txt"
{
    echo "[$(date)] $COMMIT_TITLE"
    echo "Description: $COMMIT_DESCRIPTION"
    echo "----------------------------------------"
} >> "$LOG_FILE"

# Stage the log file
git add .

# Commit the changes with the commit title and description
git commit -m "$COMMIT_TITLE" -m "$COMMIT_DESCRIPTION"

# Push the changes to the repository
git push origin master
