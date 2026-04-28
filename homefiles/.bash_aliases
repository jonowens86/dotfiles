# Jonathan Owens bash aliases and functions
# These are shortcuts and helper functions I use to make working in the terminal faster

# Basic navigation and listing shortcuts
alias ll='ls -alF'     # long listing with hidden files
alias la='ls -A'       # show all except . and ..
alias l='ls -CF'       # compact list view

# Quick directory movement
alias ..='cd ..'       # go up one directory
alias ...='cd ../..'   # go up two directories

# Clear terminal screen
alias cls='clear'

# Git shortcuts
alias gs='git status'      # check repo status
alias ga='git add .'       # add all changes
alias gc='git commit -m'   # commit with message
alias gp='git push'        # push to remote repo

# System update shortcut (Ubuntu)
alias update='sudo apt update && sudo apt upgrade -y'

# Create a directory and move into it at the same time
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Extract function for handling different archive types
extract() {
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2) tar xjf "$1" ;;   # extract tar.bz2
            *.tar.gz) tar xzf "$1" ;;    # extract tar.gz
            *.bz2) bunzip2 "$1" ;;       # extract bz2
            *.rar) unrar x "$1" ;;       # extract rar
            *.gz) gunzip "$1" ;;         # extract gz
            *.tar) tar xf "$1" ;;        # extract tar
            *.tbz2) tar xjf "$1" ;;      # extract tbz2
            *.tgz) tar xzf "$1" ;;       # extract tgz
            *.zip) unzip "$1" ;;         # extract zip
            *.Z) uncompress "$1" ;;      # extract .Z
            *.7z) 7z x "$1" ;;           # extract 7z
            *) echo "don't know how to extract '$1'" ;;  # unknown format
        esac
    else
        echo "'$1' is not a valid file"
    fi
}