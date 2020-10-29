
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sheerun/vim-polyglot'
Plug 'arzg/vim-colors-xcode'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons'

call plug#end()

set encoding=UTF-8
set autoindent
set relativenumber
set noshowcmd
set cmdheight=1
set nowrap
set hidden
set updatetime=300
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=2 smarttab
set nobackup
set noswapfile
set incsearch
set nu

" --------------------------
" ----- TAB COMPLETION -----
" --------------------------

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_disable_startup_warning = 1

" Colorscheme
colorscheme xcodedark

" Convenient custom functions

function! Config()
  edit ~/.vimrc
endfunction

function! Save()
  write
endfunction

function! Exit()
  quit
endfunction

command Config call Config()

command W call Save()
command Q call Exit()

