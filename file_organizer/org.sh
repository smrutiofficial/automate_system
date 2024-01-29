#!/bin/bash

# Specify the directory to organize
target_directory="$(pwd)"

# Create subdirectories only if there are corresponding files
find "$target_directory" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) -exec mkdir -p "$target_directory/Images" \; -exec mv {} "$target_directory/Images/" \;

find "$target_directory" -type f \( -iname "*.pdf" -o -iname "*.doc" -o -iname "*.docx" -o -iname "*.txt" -o -iname "*.xls" -o -iname "*.xlsx" -o -iname "*.pptx" \) -exec mkdir -p "$target_directory/Documents" \; -exec mv {} "$target_directory/Documents/" \;

find "$target_directory" -type f \( -iname "*.mp4" -o -iname "*.avi" -o -iname "*.mkv" -o -iname "*.mov" \) -exec mkdir -p "$target_directory/Videos" \; -exec mv {} "$target_directory/Videos/" \;

find "$target_directory" -type f \( -iname "*.svg" \) -exec mkdir -p "$target_directory/Svg" \; -exec mv {} "$target_directory/Svg/" \;

find "$target_directory" -type f \( -iname "*.zip" \) -exec mkdir -p "$target_directory/Zip" \; -exec mv {} "$target_directory/Zip/" \;

find "$target_directory" -type f \( -iname "*.webp" \) -exec mkdir -p "$target_directory/WebP" \; -exec mv {} "$target_directory/WebP/" \;

find "$target_directory" -type f \( -iname "*.mp3" -o -iname "*.flac" -o -iname "*.wav" \) -exec mkdir -p "$target_directory/Music" \; -exec mv {} "$target_directory/Music/" \;

clear
echo "Organization complete."

