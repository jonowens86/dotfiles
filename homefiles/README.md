# homefiles

This folder has my bash customization setup for my dotfiles repo.

## What’s in here

### .bash_aliases
This file has some custom aliases and a couple functions that make using the terminal easier. Instead of putting everything directly in `.bashrc`, I kept it separate so it’s cleaner and easier to manage.

Some things I added:
- shortcuts for `ls` commands
- quick directory navigation
- basic git shortcuts
- a shortcut to update the system
- `mkcd` to make and enter a folder at the same time
- `extract` to unpack different file types

### install_homefiles.sh
This script sets everything up automatically. It creates a symbolic link from the `.bash_aliases` file in this repo to my home directory.

It also:
- backs up any existing `.bash_aliases` file
- makes sure `.bashrc` is set to load the aliases
- reminds me to reload the terminal after running it

## Why I used a symbolic link

I used a symlink so I don’t have to keep copying files over. If I change something in my repo, it automatically applies since the home directory file points to it.

## Sources

- [GNU Bash Manual](https://www.gnu.org/software/bash/manual/) — used for basic reference on bash behavior
- [Ubuntu Bash Aliases Guide](https://help.ubuntu.com/community/UsingBashAliases) — helped understand how aliases are typically set up
- [Ultimate Bashrc Examples](https://www.cyberciti.biz/tips/bash-aliases-mac-centos-linux-unix.html) — looked at this for a few ideas

## AI Use

I used ChatGPT a little bit to help get started with the aliases and script, but I went through and adjusted things to fit what I actually wanted.

Prompt was something like:
"help me create a bash aliases file and install script for a dotfiles repo"