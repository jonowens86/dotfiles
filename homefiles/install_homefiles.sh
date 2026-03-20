#!/bin/bash

set -e

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
SOURCE_FILE="$REPO_DIR/.bash_aliases"
TARGET_FILE="$HOME/.bash_aliases"
BASHRC_FILE="$HOME/.bashrc"

echo "Installing bash customizations from:"
echo "$SOURCE_FILE"
echo

if [ ! -f "$SOURCE_FILE" ]; then
    echo "Error: $SOURCE_FILE not found."
    exit 1
fi

if [ -e "$TARGET_FILE" ] && [ ! -L "$TARGET_FILE" ]; then
    BACKUP_FILE="$HOME/.bash_aliases.backup.$(date +%Y%m%d_%H%M%S)"
    mv "$TARGET_FILE" "$BACKUP_FILE"
    echo "Backed up existing ~/.bash_aliases to $BACKUP_FILE"
fi

if [ -L "$TARGET_FILE" ]; then
    rm "$TARGET_FILE"
fi

ln -s "$SOURCE_FILE" "$TARGET_FILE"
echo "Created symlink: $TARGET_FILE -> $SOURCE_FILE"

if ! grep -q '\.bash_aliases' "$BASHRC_FILE"; then
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
echo "Reload your environment with:"
echo "source ~/.bashrc"
echo
echo "Or log out and back in."
echo
echo "Optional packages for some extract formats:"
echo "sudo apt install unzip p7zip-full unrar -y"