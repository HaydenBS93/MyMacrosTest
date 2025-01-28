!/bin/bash

# Navigate to the repository
cd /root/HaydenBS93/MyMacrosTest

# Stage changes
git add -A

# Commit changes with a timestamp
git commit -m "Update: $(date)"

# Push changes to GitHub
git push origin master
