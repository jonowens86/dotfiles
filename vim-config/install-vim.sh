#!/usr/bin/env bash
set -e

REPO_ROOT="$HOME/dotfiles"
SRC_VIMRC="$REPO_ROOT/vim-config/.vimrc"
DEST_VIMRC="$HOME/.vimrc"
VUNDLE_DIR="$HOME/.vim/bundle/Vundle.vim"

echo "[1/3] Copying .vimrc to home directory"
cp "$SRC_VIMRC" "$DEST_VIMRC"

echo "[2/3] Installing Vundle if missing"
if [ ! -d "$VUNDLE_DIR" ]; then
  mkdir -p "$HOME/.vim/bundle"
  git clone https://github.com/VundleVim/Vundle.vim.git "$VUNDLE_DIR"
else
  echo "Vundle already installed"
fi

echo "[3/3] Installing Vim plugins"
vim +PluginInstall +qall

echo "Vim setup complete"
