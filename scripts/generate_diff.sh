#!/bin/bash

# Get the latest and previous commit hashes
previous_commit=$(git rev-parse HEAD^)
current_commit=$(git rev-parse HEAD)

# Generate the diff file with a .diff extension
git diff "$previous_commit" "$current_commit" >temp_changes.diff

echo "Generated temp_changes.diff with changes from $previous_commit to $current_commit."
