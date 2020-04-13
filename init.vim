call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'branch': 'master' }
Plug 'exu/pgsql.vim'
Plug 'reini-1/vim-code-darker'
Plug 'yuezk/vim-js'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
call plug#end()

" Enable indent guides
let g:indent_guides_enable_on_vim_startup = 1

" Colorscheme
colorscheme codedarker

" Set terminal colors (I don't think this is currently doing anything)
set termguicolors

" Copy to system clipboard
set clipboard=unnamedplus

" Persistent undo
set undofile
set undodir=~/.vim/tmp/undo

" Window/pane switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Bind Shift-J and Shift-K to move lines up and down.
nnoremap J :m .+1<CR>==
nnoremap K :m .-2<CR>==
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Tabs
set tabstop=2
set shiftwidth=2
set expandtab

" Filetype on
filetype plugin indent on

" Enter to create blank lines below
nnoremap <CR> o<ESC>

" set line numbers
set number relativenumber

" Split new windows right
set splitright

" Escaping insert mode quickly:
inoremap jj <ESC>

" Remap semi-colon to colon:
"map ; :

" Indentation adjust
vnoremap < <gv
vnoremap > >gv

" Search settings
set hlsearch
set incsearch
set ignorecase
set smartcase

" Trim trailing spaces on save
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

autocmd BufWritePre * call TrimWhitespace()

" Detect opening/closing brackets and insert new line between them
fun! DetectBrackets()
  if matchstr("}{)(", getline(".")[col(".")-1] . getline(".")[col(".")-2]) != ""
    return "\<CR>\<Esc>O"
  else
    return "\<CR>"
  endif
endfun

inoremap <expr> <CR> DetectBrackets()

" Golang syntax highlighting
let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_build_constraints = 1
let g:go_mod_fmt_autosave = 1

" SQL syntax highlighting
let g:sql_type_default = 'pgsql'

" NERDTree settings
" ===================

" NERDTree start when opening directories
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | wincmd p | endif

let NERDTreeShowHidden=1

" Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

" NERDCommenter keymaps
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

" Turns off auto comment on new lines
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Coc settings
"=========================

" If hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" Don't give |ins-completion-menu| messages.
set shortmess+=c

" Always show signcolumns
set signcolumn=yes

" COC extensions
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-eslint',
  \ 'coc-json',
  \ 'coc-tsserver',
  \ 'coc-emmet',
  \ ]

" Use tab to trigger completion, completion confirm, snippet expand and jump
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
