" ---------------------------
" Vundle setup
" ---------------------------

" Disable compatibility mode (required for plugins)
set nocompatible

" Turn off filetype detection temporarily
filetype off

" Add Vundle to runtime path
set rtp+=~/.vim/bundle/Vundle.vim

" Start Vundle plugin system
call vundle#begin()

" Plugin manager
Plugin 'VundleVim/Vundle.vim'

" Color scheme plugin
Plugin 'nanotech/jellybeans.vim'

" Indentation guide plugin
Plugin 'preservim/vim-indent-guides'

" End Vundle setup
call vundle#end()

" Re-enable filetype detection, plugins, and indentation
filetype plugin indent on

" Enable syntax highlighting
syntax on

" Show line numbers
set number

" Use spaces instead of tabs
set expandtab

" Set indentation width to 4 spaces
set shiftwidth=4

" Set tab display width to 4 spaces
set tabstop=4

" Enable indent guides automatically on startup
let g:indent_guides_enable_on_vim_startup = 1

" Set color scheme
colorscheme jellybeans