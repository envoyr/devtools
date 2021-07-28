#!/bin/bash

# Update repository
cd "$DEVTOOLS_DIRECTORY" || exit
git fetch --all --quiet
git reset --hard origin/main --quiet

# Set permissions
chmod +x "$DEVTOOLS_DIRECTORY/devtools"