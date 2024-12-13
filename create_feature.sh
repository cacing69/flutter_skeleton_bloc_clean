#!/bin/bash
# Module generator by @cacing69

# Get the first argument
# feature_name=$1

# # Check if the argument is provided
# if [ -z "$feature_name" ]; then
#   echo "No argument provided."
#   exit 1  # Exit with status 1 if no argument is passed
# fi

# Ambil nama fitur dari pengguna
read -p "Insert feature name: " feature_name

# create with argument name on /lib/features
dir_feature_name="$(pwd)/lib/features/"
stubs_path="$(pwd)/stubs"
feature_target_path="$dir_feature_name$feature_name"

# Buat direktori tujuan jika belum ada
mkdir -p "$feature_target_path"

# copy isi stubs ke module baru
echo "Creating feature..."
yes | cp -rf "$stubs_path/"* "$feature_target_path"

# creating feature page
old_page_path="$feature_target_path/presentation/pages/stub_page"
new_page_path="$feature_target_path/presentation/pages/${feature_name}_page.dart"
if [ -f "$old_page_path" ]; then
  mv "$old_page_path" "$new_page_path"
  echo "Renamed feature_page.dart to ${feature_name}_page.dart"
else
  echo "Error: File feature_page.dart tidak ditemukan di $old_page_path"
  exit 1
fi

echo "feature created"
exit 0
