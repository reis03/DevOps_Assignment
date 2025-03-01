#!/bin/bash

write_to_file() {
  local filename="$1"
  local text="$2"
  echo "$text" > "$filename"
}

copy_file() {
  local source_file="$1"
  local destination_file="$2"
  cp "$source_file" "$destination_file"
}

filter_file() {
  local filename="$1"
  local choice="$2"

  case "$choice" in
    "count_dots")
      grep -o "\." "$filename" | wc -l
      ;;
    "count_lines")
      wc -l < "$filename"
      ;;
    "find_xyz_words")
      grep -o '\bxyz\w*\b' "$filename"
      ;;
    *)
      echo "Wrong choice"
      ;;
  esac
}


write_to_file "reis.txt" "Reis Stanovci - Bash Script."

copy_file "reis.txt" "copy_reis.txt"

echo "Count of dots: $(filter_file 'reis.txt' 'count_dots')"

echo "Count of lines: $(filter_file 'reis.txt' 'count_lines')"

echo "Words starting with 'xyz':"
filter_file "reis.txt" "find_xyz_words"
