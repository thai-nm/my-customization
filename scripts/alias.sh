#!/bin/bash

# Check if correct number of arguments provided
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <alias_name> <directory>"
  exit 1
fi

# Assign arguments to variables
alias_name="$1"
directory="$2"

# Add alias line to config.fish file
echo "alias $alias_name=\"cd \$HOME/workplace/$directory\"" >>"$HOME/.config/fish/config.fish"

echo "Alias added successfully."
