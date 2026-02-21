# vim-config

## What this folder contains
- `.vimrc` — Vim configuration managed in this dotfiles repo
- `install-vim.sh` — setup script that:
  - copies `.vimrc` into `~/.vimrc`
  - installs Vundle if missing
  - installs plugins via `vim +PluginInstall +qall`

## How to run
From the cloned dotfiles repo:
```bash
./install-vim.sh
