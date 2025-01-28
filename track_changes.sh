#!/bin/bash

# Navigate to the repository
cd /root//MyMacrosTest

# Use the first argument as the commit message or fallback to a default timestamp
COMMIT_MESSAGE=${1:-"Update: $(date)"}

# Stage changes
git add -A

# Commit changes with the provided message
git commit -m "$COMMIT_MESSAGE"

# Push changes to GitHub
git push origin master

