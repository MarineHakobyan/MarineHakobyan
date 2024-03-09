#!/bin/bash

repo="MarineHakobyan/MarineHakobyan"
branch="output"
readme_file="README.md"

  old_commit_hash=$(grep -o -m 1 '[0-9a-f]\{40\}' $readme_file)
  new_commit_hash=$(git ls-remote --heads origin $branch | awk '{print $1}')

  sed -i "s|$old_commit_hash|$new_commit_hash|g" $readme_file
