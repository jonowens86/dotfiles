#!/usr/bin/env bash

# Exit immediately if a command fails
set -e

# Define paths for repo and Vim config files
REPO_ROOT="$HOME/dotfiles"
SRC_VIMRC="$REPO_ROOT/vim-config/.vimrc"
DEST_VIMRC="$HOME/.vimrc"
VUNDLE_DIR="$HOME/.vim/bundle/Vundle.vim"

echo "[1/3] Copying .vimrc to home directory"

# Copy .vimrc from repo to user's home directory
cp "$SRC_VIMRC" "$DEST_VIMRC"

echo "[2/3] Installing Vundle if missing"

# Check if Vundle is already installed
if [ ! -d "$VUNDLE_DIR" ]; then
  # Create plugin directory if it doesn't exist
  mkdir -p "$HOME/.vim/bundle"

  # Clone Vundle plugin manager from GitHub
  git clone https://github.com/VundleVim/Vundle.vim.git "$VUNDLE_DIR"
else
  echo "Vundle already installed"
fi

echo "[3/3] Installing Vim plugins"

# Run Vim command to install plugins defined in .vimrc
vim +PluginInstall +qall

echo "Vim setup complete"