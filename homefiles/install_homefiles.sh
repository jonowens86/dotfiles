#!/bin/bash

# Exit immediately if a command fails
set -e

# Get the directory where this script is located
REPO_DIR="$(cd "$(dirname "$0")" && pwd)"

# Define source (repo) and target (home directory) file paths
SOURCE_FILE="$REPO_DIR/.bash_aliases"
TARGET_FILE="$HOME/.bash_aliases"
BASHRC_FILE="$HOME/.bashrc"

echo "Installing bash customizations from:"
echo "$SOURCE_FILE"
echo

# Check if the source file exists in the repo
if [ ! -f "$SOURCE_FILE" ]; then
    echo "Error: $SOURCE_FILE not found."
    exit 1
fi

# If a regular .bash_aliases file already exists, back it up
if [ -e "$TARGET_FILE" ] && [ ! -L "$TARGET_FILE" ]; then
    BACKUP_FILE="$HOME/.bash_aliases.backup.$(date +%Y%m%d_%H%M%S)"
    mv "$TARGET_FILE" "$BACKUP_FILE"
    echo "Backed up existing ~/.bash_aliases to $BACKUP_FILE"
fi

# If a symlink already exists, remove it so we can recreate it
if [ -L "$TARGET_FILE" ]; then
    rm "$TARGET_FILE"
fi

# Create a symbolic link from repo file to home directory
ln -s "$SOURCE_FILE" "$TARGET_FILE"
echo "Created symlink: $TARGET_FILE -> $SOURCE_FILE"

# Check if .bashrc already loads .bash_aliases
if ! grep -q '\.bash_aliases' "$BASHRC_FILE"; then
    # If not, append a block to load it automatically
    cat >> "$BASHRC_FILE" <<'EOF'

# Load custom bash aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
EOF
    echo "Added ~/.bash_aliases sourcing block to ~/.bashrc"
else
    echo "~/.bashrc already appears to source ~/.bash_aliases"
fi

echo
echo "Done."

# Instructions for user after installation
echo "Reload your environment with:"
echo "source ~/.bashrc"
echo
echo "Or log out and back in."
echo

# Optional packages needed for some archive formats used in extract function
echo "Optional packages for some extract formats:"
echo "sudo apt install unzip p7zip-full unrar -y"