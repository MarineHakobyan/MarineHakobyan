#!/bin/bash

repo="MarineHakobyan/MarineHakobyan"  # Replace with your repository path
branch="output"  # Replace with the branch name
readme_file="README.md"  # Replace with the path to your README file

files=$(git log --pretty=format: --name-only --diff-filter=A origin/$branch | sort - | sed '/^$/d')

for file in $files
do
  old_commit_hash=$(grep -o -m 1 '[0-9a-f]\{40\}' $readme_file)
  new_commit_hash=$(git ls-remote --heads origin $branch | awk '{print $1}')
  sed -i "s|$old_commit_hash|$new_commit_hash|g" $readme_file
done
