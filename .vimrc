set guicursor=
set relativenumber
set nu
set nohlsearch
set scrolloff=8
set signcolumn=yes
set tabstop=8 softtabstop=0 expandtab shiftwidth=3 smarttab

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif


call plug#begin()

Plug 'preservim/NERDTree'

call plug#end()

silent! nmap <C-p> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>
let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"

