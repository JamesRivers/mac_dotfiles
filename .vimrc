set guicursor=
set relativenumber
set nu
set nohlsearch
set scrolloff=8
set signcolumn=yes
set tabstop=8 softtabstop=0 expandtab shiftwidth=3 smarttab
set spell
set nocompatible
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif


call plug#begin()

" Automatically install missing plugins on startup
if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
  autocmd VimEnter * PlugInstall | q
endif
"my plugins
Plug 'preservim/NERDTree'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

call plug#end()

"remap nerdtree to F2
silent! nmap <C-p> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>
let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"

"remap fzf to c f 
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <C-g> :File ../../<CR>
"remap rg to f 
nnoremap <silent> <Leader>f :Rg<CR>

"vim grep to ripgrep
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
