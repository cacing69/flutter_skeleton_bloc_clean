#!/bin/bash
# Module generator by @cacing69

# Get the first argument
feature_name=$1

# Check if the argument is provided
if [ -z "$feature_name" ]; then
  echo "No argument provided."
  exit 1  # Exit with status 1 if no argument is passed
fi

# create with argument name on /lib/features
dir_feature_name="$(pwd)/lib/features/"
mkdir "$dir_feature_name$feature_name"

exit 0
