#!/bin/bash

# Function to initialize Git repository
initialize_repository() {
    git init
}

# Function to create README file
create_readme() {
    touch README.md
    echo "# My Project" >> README.md
}

# Function to perform initial commit
initial_commit() {
    git add .
    git commit -m "Initial commit"
}

# Function to set up remote repository
set_remote() {
    echo "Enter the remote repository URL (e.g., git@github.com:username/repo.git):"
    read remote_url
    git remote add origin $remote_url
}

# Function to set Git branch to main
set_git_branch() {
    git branch -M main
}

# Function to display Git status
display_git_status() {
    git status
}

# Function to push to the main branch of the remote repository
push_to_remote() {
    git push -u origin main
}

# Main function
main() {
    initialize_repository
    create_readme
    initial_commit
    set_remote

    echo -e "\nSetting Git branch to main:"
    set_git_branch

    echo -e "\nGit Status after initial commit:"
    display_git_status

    echo -e "\nPushing to the main branch of the remote repository:"
    push_to_remote

    echo "Git repository setup complete!"
}

# Run the main function
main

