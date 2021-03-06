
call plug#begin('~/.vim/plugged')

Plug 'nvie/vim-flake8'
Plug 'vim-scripts/indentpython.vim'
Plug 'evanleck/vim-svelte'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sheerun/vim-polyglot'
Plug 'arzg/vim-colors-xcode'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'itchyny/lightline.vim'
" Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plug 'ryanoasis/vim-devicons'
Plug 'jiangmiao/auto-pairs'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'sickill/vim-monokai'
Plug 'fannheyward/coc-pyright'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/0.x'
  \ }

" Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Yggdroot/indentLine'
Plug 'lukas-reineke/indent-blankline.nvim'

call plug#end()

set t_Co=256

let &t_SI = "\e[2 q"  " blinking I-beam in insert mode
let &t_SR = "\e[2 q"  " blinking underline in replace mode
let &t_EI = "\e[2 q"  " default cursor (usually blinking block) otherwise

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
filetype plugin on

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

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" let g:coc_disable_startup_warning = 1

" Colorscheme
colorscheme xcodedarkhc

" Convenient custom functions

function! Config()
  edit ~/.config/nvim/init.vim
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

tnoremap <Esc> <C-\><C-n>

let g:prettier#config#config_precedence = 'file-override'

"==========GOLANG=============
set autowrite

autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)

let g:go_fmt_command = "goimports"


"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"==========COC================
" CoC recommended config
let g:coc_start_at_startup = 1
let g:coc_global_extensions = [
          \ 'coc-json',
          \ 'coc-css',
          \ 'coc-ultisnips',
          \ 'coc-tsserver',
          \ 'coc-emmet',
          \ 'coc-tag',
          \ 'coc-omni',
          \ 'coc-syntax',
          \ 'coc-yaml',
          \ 'coc-solargraph',
          \ 'coc-phpls',
          \ 'coc-html',
          \ 'coc-tailwindcss',
          \ 'coc-markdownlint',
          \ 'coc-git',
          \ 'coc-jedi',
          \ ]

"==========NERDTREE===========

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Open NERDTREE if no file was passed
function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction

autocmd VimEnter * call StartUp()

"==========Python=============
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" Mark unnecessary whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

let python_highlight_all=1

"=============================

au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

