" =======
" Plugins
" =======
call plug#begin('~/.vim/plugged') " https://github.com/junegunn/vim-plug
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'branch': 'master' }
Plug 'exu/pgsql.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'vim-syntastic/syntastic'
call plug#end()


" ==============
" Color settings
" ==============
set termguicolors " GUI color format
set t_Co=256 " Color depth
colorscheme codedark " Colorscheme
set cursorline " Highlight line under cursor
hi Normal guibg=black| " Normal background is black
hi nonText guibg=black| " nonText background is black
hi EndOfBuffer guibg=black| " EndOfBuffer background is black


" ==========
" Statusline
" ==========
set statusline=%2*\ \ \ \ %* " Padding (black)
set statusline+=%1*%r%* " Read only (red)
set statusline+=%1*%M%* " Modified (red)
set statusline+=\ %f " File name/path
set statusline+=\ \ %P " Percentage of file
set statusline+=\ \ %y " File-type
set statusline+=%= " Alignment separator
set statusline+=%v " Column number
set statusline+=\ \ 0x%B\  " Hex value of char under cursor
hi statusline guibg=grey guifg=black| " Set default color
hi User1 guifg=white guibg=red| " Color group for red
hi User2 guifg=white guibg=black| " Color group for black
au InsertEnter * hi statusline guibg=blue guifg=white| " Insert mode blue/white
au InsertLeave * hi statusline guibg=grey guifg=black| " Normal mode grey/black


" ===================
" Syntax highlighting
" ===================
let g:go_highlight_structs = 1 " Go syntax highlighting
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_build_constraints = 1
let g:go_mod_fmt_autosave = 1
let g:sql_type_default = 'pgsql' " PostgreSQL syntax highlighting


" =================
" NERDTree settings
" =================
let NERDTreeShowHidden=1 " Show hidden files by default
let NERDTreeMinimalUI = 1 " Show less junk
let NERDTreeDirArrows = 1 " Show arrow/+ next to directories

" Start NERDTree when opening directories
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1
      \ && isdirectory(argv()[0])
      \ && !exists("s:std_in")
      \ | exe 'NERDTree' argv()[0]
      \ | wincmd p
      \ | ene
      \ | exe 'cd '.argv()[0]
      \ | wincmd p
      \ | endif


" ===========================
" Editing behavior/formatting
" ===========================
set autoread " Auto-read file when changes are detected
set clipboard=unnamed " Copy to system clipboard
set undofile " Persistent undo
set undodir=~/.vim/tmp/undo
set tabstop=2 " Tab size
set softtabstop=2 " Amount of spaces in each tab
set shiftwidth=2 " Size of space when auto-indenting
set expandtab " Replace tab with it's length in spaces
filetype plugin indent on " Detect filetypes
set number relativenumber " Set line numbers relative to cursor position
set splitright " Split new windows right
set hlsearch " Highlight search results
set ignorecase " Ignore case when searching
set smartcase " Ignore the avove setting if query contains uppercase letters
set noshowmatch " Prevents cursor from moving when creating parentheses

" Turn off auto-comment for new lines
autocmd FileType *
      \ setlocal formatoptions-=cro

" Trim trailing spaces on save
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun
autocmd BufWritePre *
      \ call TrimWhitespace()

" Set formatting program to clang-format for c/c++ files
autocmd FileType c,cpp
      \ setlocal equalprg=clang-format\ -style=microsoft

" Set formatting progam to gofmt for go files
autocmd FileType go
      \ setlocal equalprg=gofmt


" ======================
" == Key binds/remaps ==
" ======================
" Ctrl-hjkl for window/pane switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Shift-J and Shift-K to move lines up and down
nnoremap J :m .+1<CR>==
nnoremap K :m .-2<CR>==
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Enter creates new line in normal mode
nnoremap <CR> o<ESC>

" Ignore case when saving with :w or :wq
command W w
command Q q
command WQ wq
command Wq wq

" Indent lines/blocks
vnoremap < <gv
vnoremap > >gv

" Auto create/format brackets
inoremap {<CR> {<CR>}<Esc>O
inoremap { {  }<Esc>hi
inoremap [<CR> [<CR>]<Esc>O
inoremap [ []<Esc>i
inoremap ( ()<Esc>i

" Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

" Comment lines/blocks
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

