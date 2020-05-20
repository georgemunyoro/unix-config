
" ==========================
" ========= Plugins ========
" ==========================
"
call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'sff1019/vim-joker'
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'powerline/powerline-fonts'
Plug 'vim-syntastic/syntastic'

call plug#end()

" ==========================
" ==== General Settings ====
" ==========================
"
colorscheme joker

set autoindent
set smarttab
set relativenumber

set hidden
set updatetime=300

set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=2 smarttab

set t_Co=256

let g:airline#extensions#tabline#enabled = 1

" ==========================
" ==== General Settings ====
" ==========================
"
" ----- TAB COMPLETION -----

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

function! Config()
  edit ~/.config/nvim/init.vim
endfunction

command Config call Config()

" ==========================
" ==== General Settings ====
" ==========================
"
"
" air-line
let g:airline_powerline_fonts = 1
" air-line
let g:airline_powerline_fonts = 1



if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif


" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" Syntastic Settings

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
