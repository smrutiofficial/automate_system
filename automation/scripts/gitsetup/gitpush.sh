#!/bin/bash

# Get the current directory
repo_path=$(pwd)

# Display Git status
git status

# Prompt user to add changes
read -p "Do you want to add all changes? (y/n): " add_changes

if [ "$add_changes" == "y" ]; then
    # Add all changes
    git add .
    echo "Changes added."
else
    echo "No changes added. Exiting."
    exit 0
fi

# Prompt user for commit message
echo "Enter your commit message:"
read commit_message

git commit -m "$commit_message"
git push origin main 

# Get the remote repository URL
remote_url=$(git remote get-url origin)

# Convert Git URL to HTTPS for GitHub
web_url=${remote_url/git@github.com:/https://github.com/}
web_url=${web_url%.git}

# Display the remote repository web URL
echo "Remote repository URL: $web_url"
