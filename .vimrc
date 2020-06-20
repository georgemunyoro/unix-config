
" ==========================
" ========= Plugins ========
" ==========================

call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

Plug 'vim-syntastic/syntastic'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'mxw/vim-jsx'
Plug 'stoeffel/material-iterm'
Plug 'ayu-theme/ayu-vim'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-surround'
Plug 'nlknguyen/papercolor-theme'

call plug#end()

" ==========================
" ==== General Settings ====
" ==========================

set termguicolors
set background=light
colorscheme PaperColor

set guifont=Hack:h11
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

let g:airline#extensions#tabline#enabled = 1
let g:coc_disable_startup_warning = 1

"---------------------------
" ----- TAB COMPLETION -----
"---------------------------

inoremap <silent><expr> <TAB>
	  \ pumvisible() ? "\<C-n>" :
	  \ <SID>check_back_space() ? "\<TAB>" :
	  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"---------------------------
"---------------------------

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

" ==========================

if !exists('g:AutoPairsShortcutJump')
  let g:AutoPairsShortcutJump = '<C-l>'
endif
