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

# Display the remote repository URL
echo "Remote repository URL: $remote_url"
