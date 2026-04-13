# dotfiles

This repo contains my personal Linux dotfiles and setup scripts that I use to customize my environment. It includes my bash aliases, vim configuration, and scripts to install software.

## What’s in this repo

### vim-config
This folder contains my `.vimrc` file and setup script for configuring vim. It uses Vundle to install plugins and set up my editor the way I like it.

### homefiles
This folder contains my bash customization setup.

It includes:
- `.bash_aliases` with shortcuts, navigation helpers, and functions
- a script to link the file into my home directory

### sys-installs
This folder contains install scripts for software on Ubuntu.

Each script:
- checks for root privileges
- verifies the system is using `apt`
- installs software automatically
- avoids conflicts if the command already exists

## How to use this repo

Clone the repository:

git clone https://github.com/jonowens86/dotfiles.git
cd dotfiles

Each folder has its own README with instructions. You can go into the folder you want and run the script for that setup.

## Why I made this

This repo is mainly for keeping my environment consistent and making it easier to set things up again on a new system.

## Future improvements

- add more comments to scripts
- expand bash aliases and functions
- improve error handling in scripts
- add more install scripts for other tools

Closes # 1