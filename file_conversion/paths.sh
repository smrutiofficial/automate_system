#!/bin/bash

# Ask the user for input paths
echo "Enter the paths (separated by single quotes and space):"
read -r paths

files=""
# Loop through each path provided by the user
IFS="'" read -ra paths_array <<< "$paths"
for path in "${paths_array[@]}"; do
  # Trim leading and trailing spaces
  trimmed_path=$(echo "$path" | xargs)
  
  # Check if the path is not empty
  if [ -n "$trimmed_path" ]; then
    # Get the filename using basename and quote it
    filename=$(basename "$trimmed_path")
    files="$files \"$filename\""
  fi
done
clear
# Print the list of quoted filenames
echo $files

