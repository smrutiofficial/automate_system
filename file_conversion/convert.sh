#!/bin/bash

# Ask the user for input paths
echo "Enter the paths (separated by single quotes):"
read -r paths

declare -a files=()  # Use an array to store files
prefix_to_remove="/home/smruti/"
IFS="'" read -ra paths_array <<<"$paths"


for path in "${paths_array[@]}"; do
  trimmed_path=$(echo "$path" | xargs)
  if [ -n "$trimmed_path" ]; then
    filename=$(basename "$trimmed_path")
    # Remove the specified prefix from the path
    path_without_prefix=$(echo "$trimmed_path" | sed "s|$prefix_to_remove||")
    files+=("~/$(dirname "$path_without_prefix")$filename")  # Append to the array
    first_element_processed=true
  fi
done

clear
for file in "${files[@]}"; do
  echo "$file"  # Print all elements in the array
done


# Ask the user for conversion option
echo "Choose a file conversion option:"
echo "1. Word to PDF"
echo "2. Excel to PDF"
echo "3. PDF to JPG"
echo "4. PDF to Word"
echo "5. PDF to PowerPoint"
echo "6. PDF to Excel"
echo "7. PowerPoint to PDF"
echo "8. JPG to PDF"

read -p "Enter the option number: " option

case $option in
1)
  # Use the list of files obtained earlier for batch conversion
  echo "Converting Word to PDF..."
  for file in "${files[@]}"; do
    input_file="$file"
    output_file="${file%.*}.pdf"
    ~/dev/bashscript/file_conversion/converter "$input_file" "$output_file" word_to_pdf
  done
  ;;
2)
  # Use the list of files obtained earlier for batch conversion
  echo "Converting Excel to PDF..."
  for file in "${files[@]}"; do
    input_file="$file"
    output_file="${file%.*}.pdf"
    ~/dev/bashscript/file_conversion/converter "$input_file" "$output_file" excel_to_pdf
  done
  ;;
3)
  # Use the list of files obtained earlier for batch conversion
  echo "Converting PDF to JPG..."
  for file in "${files[@]}"; do
    input_file="$file"
    output_file="${file%.*}.jpg"
    ~/dev/bashscript/file_conversion/converter "$input_file" "$output_file" pdf_to_jpg
  done
  ;;
4)
  # Use the list of files obtained earlier for batch conversion
  echo "Converting PDF to Word..."
  for file in "${files[@]}"; do
    input_file="$file"
    output_file="${file%.*}.docx"
    ~/dev/bashscript/file_conversion/converter "$input_file" "$output_file" pdf_to_word
  done
  ;;
5)
  # Use the list of files obtained earlier for batch conversion
  echo "Converting PDF to PowerPoint..."
  for file in "${files[@]}"; do
    input_file="$file"
    output_file="${file%.*}.pptx"
    ~/dev/bashscript/file_conversion/converter "$input_file" "$output_file" pdf_to_powerpoint
  done
  ;;
6)
  # Use the list of files obtained earlier for batch conversion
  echo "Converting PDF to Excel..."
  for file in "${files[@]}"; do
    input_file="$file"
    output_file="${file%.*}.xlsx"
    ~/dev/bashscript/file_conversion/converter "$input_file" "$output_file" pdf_to_excel
  done
  ;;
7)
  # Use the list of files obtained earlier for batch conversion
  echo "Converting PowerPoint to PDF..."
  for file in "${files[@]}"; do
    input_file="$file"
    output_file="${file%.*}.pdf"
    ~/dev/bashscript/file_conversion/converter "$input_file" "$output_file" powerpoint_to_pdf
  done
  ;;
8)
  # Use the list of files obtained earlier for batch conversion
  echo "Converting JPG to PDF..."
  for file in "${files[@]}"; do
    input_file="$file"
    output_file="${file%.*}.pdf"
    ~/dev/bashscript/file_conversion/converter "$input_file" "$output_file" jpg_to_pdf
  done
  ;;
*)
  echo "Invalid option. Please choose a valid option."
  ;;
esac
