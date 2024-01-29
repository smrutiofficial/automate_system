#!/bin/bash

# Specify the directory to organize
target_directory="/home/smruti/Downloads/Other"

# Create subdirectories if they don't exist
mkdir -p "$target_directory/Images"
mkdir -p "$target_directory/Documents"
mkdir -p "$target_directory/Videos"
mkdir -p "$target_directory/Svg"
mkdir -p "$target_directory/Zip"
mkdir -p "$target_directory/Music"
mkdir -p "$target_directory/WebP"

# Move images to the "Images" directory
find "$target_directory" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) -exec mv {} "$target_directory/Images/" \;

# Move documents to the "Documents" directory
find "$target_directory" -type f \( -iname "*.pdf" -o -iname "*.doc" -o -iname "*.docx" -o -iname "*.txt" -o -iname "*.xls" -o -iname "*.xlsx" -o -iname "*.pptx" \) -exec mv {} "$target_directory/Documents/" \;

# Move videos to the "Videos" directory
find "$target_directory" -type f \( -iname "*.mp4" -o -iname "*.avi" -o -iname "*.mkv" -o -iname "*.mov" \) -exec mv {} "$target_directory/Videos/" \;

#move svgs
find "$target_directory" -type f \( -iname "*.svg" \) -exec mv {} "$target_directory/Svg/" \;

#move zip
find "$target_directory" -type f \( -iname "*.zip" \) -exec mv {} "$target_directory/Zip/" \;

# Move WebP images to the "WebP" directory
find "$target_directory" -type f \( -iname "*.webp" \) -exec mv {} "$target_directory/WebP/" \;

# Move music files to the "Music" directory
find "$target_directory" -type f \( -iname "*.mp3" -o -iname "*.flac" -o -iname "*.wav" \) -exec mv {} "$target_directory/Music/" \;



clear
echo "Organization complete."
