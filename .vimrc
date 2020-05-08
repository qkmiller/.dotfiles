" =============
" == Plugins ==
" =============

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'branch': 'master' }
Plug 'exu/pgsql.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
call plug#end()


" ===========================
" == Color/visual settings ==
" ===========================

" Terminal colors
set termguicolors
set t_Co=256

" Colorscheme
colorscheme codedark

" Change background to pure black
hi Normal guibg=black
hi nonText guibg=black
hi EndOfBuffer guibg=black

" Highlight line under cursor
set cursorline

" Set default statusline color
hi statusline guibg=grey guifg=black

" Statusline left-aligned items
set statusline=\ %1*%r%*
set statusline+=\ %1*%M%*
set statusline+=\ %f
set statusline+=\ \ %P
set statusline+=\ \ %y

" Statusline separator between left-aligned and right-aligned items
set statusline+=%=

" Statusline right-aligned items
set statusline+=0x%B\ "

" Statusline color group for 'Modified'
hi User1 guifg=white guibg=red

" Change color of statusline while in insert mode
au InsertEnter * hi statusline guibg=blue guifg=white
au InsertLeave * hi statusline guibg=grey guifg=black

" Go syntax highlighting
let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_build_constraints = 1
let g:go_mod_fmt_autosave = 1

" PostgreSQL syntax highlighting
let g:sql_type_default = 'pgsql'


" =============================
" == Editing behavior tweaks ==
" =============================

" Copy to system clipboard
set clipboard=unnamed

" Persistent undo
set undofile
set undodir=~/.vim/tmp/undo

" Tab settings
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Filetype on
filetype plugin indent on

" set line numbers relative to cursor
set number relativenumber

" Split new windows right
set splitright

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

" Start NERDTree when opening directories
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | wincmd p | endif

let NERDTreeShowHidden=1

" Detect opening/closing brackets/parentheses. Pressing 'Enter' places cursor in new line between them (Use with COC)
fun! DetectBrackets()
  if matchstr("}{)(", getline(".")[col(".")-1] . getline(".")[col(".")-2]) != ""
    return "\<CR>\<Esc>O\<Tab>"
  else
    return "\<CR>"
  endif
endfun

" Detect opening bracket only. Pressing 'Enter' creates a closing bracket on a new line and places the cursor in another new line above it. (Use without COC)
fun! DetectOpenBracket()
  if matchstr("{", getline(".")[col(".")-1] . getline(".")[col(".")-2]) != ""
    return "\<CR>}\<Esc>O"
  else
    return "\<CR>"
  endif
endfun

" Turn off auto-comment on new lines
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


" ======================
" == Key binds/remaps ==
" ======================

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

" Enter creates new lines
nnoremap <CR> o<ESC>

" Bind :W and :Q to :w and :q
command W w
command Q q
command WQ wq
command Wq wq

" Indentation adjust
vnoremap < <gv
vnoremap > >gv

inoremap <expr> <CR> DetectOpenBracket()

" Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

" NERDCommenter shortcuts
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

