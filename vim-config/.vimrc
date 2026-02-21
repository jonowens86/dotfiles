" ---------------------------
" Vundle setup
" ---------------------------
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'preservim/vim-indent-guides'

call vundle#end()
filetype plugin indent on

syntax on
set number
set expandtab
set shiftwidth=4
set tabstop=4

let g:indent_guides_enable_on_vim_startup = 1

colorscheme jellybeans
