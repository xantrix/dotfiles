set encoding=utf8

set tabstop=2
set expandtab
set shiftwidth=2

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
set pastetoggle=<f5>

set number
set ruler
syntax enable 

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <C-space> ?

" Always show the status line
set laststatus=2

" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'
call plug#begin()
Plug 'jamessan/vim-gnupg'
call plug#end()