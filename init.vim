" Plugins
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'branch': 'master' }
Plug 'exu/pgsql.vim'
Plug 'reini-1/vim-code-darker'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
call plug#end()


" Enable indent guides
let g:indent_guides_enable_on_vim_startup = 1


" Colorscheme
colorscheme codedarker


" Set terminal colors
set termguicolors


" Change color of statusline per mode
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=green guifg=black
  elseif a:mode == 'r'
    hi statusline guibg=magenta guifg=white
  else
    hi statusline guibg=red guifg=white
  endif
endfunction

hi statusline guibg=blue guifg=white
au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertChange * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=blue guifg=white


" Change satusline info
set statusline=\ %1*%M%*
set statusline+=\ %f
set statusline+=\ \ %P
set statusline+=\ \ %y
set statusline+=%=
set statusline+=0x%B\ "

" Statusline color group for 'Modified'
hi User1 guifg=white guibg=red


" Copy to system clipboard
set clipboard=unnamed


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


" Enter creates new lines
nnoremap <CR> o<ESC>


" Bind :W and :Q to :w and :q
command W w
command Q q
command Wq wq
command WQ wq


" set line numbers relative to cursor
set number relativenumber


" Split new windows right
set splitright


" Escape insert mode quickly:
inoremap jj <ESC>


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


" Detect opening/closing brackets/parentheses and insert new line between them
fun! DetectBrackets()
  if matchstr("}{)(", getline(".")[col(".")-1] . getline(".")[col(".")-2]) != ""
    return "\<CR>\<Esc>O\<Tab>"
  else
    return "\<CR>"
  endif
endfun


" Detect opening bracket only and create a new line with an ending bracket
fun! DetectOpenBracket()
  if matchstr("{", getline(".")[col(".")-1] . getline(".")[col(".")-2]) != ""
    return "\<CR>}\<Esc>O"
  else
    return "\<CR>"
  endif
endfun

inoremap <expr> <CR> DetectOpenBracket()


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


" NERDTree start when opening directories
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | wincmd p | endif

let NERDTreeShowHidden=1


" Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>


" NERDCommenter shortcuts
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle


" Turn off auto-comment on new lines
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
