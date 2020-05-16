" ========
" Vim-plug
" ========
call plug#begin('~/.vim/plugged')
Plug 'wikitopian/hardmode'
Plug 'scrooloose/nerdcommenter'
Plug 'tomasiser/vim-code-dark'
Plug 'vim-syntastic/syntastic'
Plug 'octol/vim-cpp-enhanced-highlight', {
      \ 'for': 'cpp' }
Plug 'fatih/vim-go', {
      \ 'for': 'go',
      \ 'do': ':GoUpdateBinaries',
      \ 'branch': 'master'}
Plug 'exu/pgsql.vim', {
      \ 'for': 'sql' }
Plug 'yuezk/vim-js', {
      \ 'for': ['js', 'jsx']}
Plug 'maxmellon/vim-jsx-pretty', {
      \ 'for': ['js', 'jsx'] }
Plug 'junegunn/fzf', {
      \ 'dir': '~/.fzf',
      \ 'do': './install --all'}
call plug#end()


" ==============
" Color settings
" ==============
set termguicolors
set t_Co=256
colorscheme codedark
set cursorline
set hlsearch
hi Normal guibg=black ctermbg=black
hi nonText guibg=black ctermbg=black
hi EndOfBuffer guibg=black ctermbg=black
hi Pmenu guibg=grey guifg=black ctermbg=grey ctermfg=black
hi PmenuSel guibg=blue guifg=white ctermbg=blue ctermfg=white
hi WildMenu guibg=blue guifg=white ctermbg=blue ctermfg=white
hi statusline guibg=grey guifg=black ctermbg=grey ctermfg=black
hi User1 guibg=red guifg=white ctermbg=red ctermfg=white
hi User2 guibg=black guifg=white ctermbg=black ctermfg=white
hi TabLineSel guibg=blue guifg=white ctermbg=blue ctermfg=white
au InsertEnter *
      \ hi statusline guibg=blue guifg=white  ctermbg=blue ctermfg=white
au InsertLeave *
      \ hi statusline guibg=grey guifg=black ctermbg=grey ctermfg=black
hi SpellBad guibg=red guifg=white ctermbg=red ctermfg=white
hi SpellCap guibg=red guifg=white ctermbg=red ctermfg=white
hi SpellRare guibg=magenta guifg=black ctermbg=magenta ctermfg=black
hi SpellLocal guibg=grey guifg=black ctermbg=grey ctermfg=black


" ==========
" Statusline
" ==========
set statusline=\ \ \ \ "
set statusline+=%1*%r%*
set statusline+=%1*%M%*
set statusline+=\ "
set statusline+=%f
set statusline+=\ \ "
set statusline+=%l\  "
set statusline+=/
set statusline+=\ %L "
set statusline+=\ \ "
set statusline+=%y
set statusline+=%=
set statusline+=%v
set statusline+=\ \ "
set statusline+=0x%B
set statusline+=\ "


" ===================
" Syntax highlighting
" ===================
let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_build_constraints = 1
let g:go_mod_fmt_autosave = 1
let g:sql_type_default = 'pgsql'


" ========================
" General editing behavior
" ========================
let g:loaded_netrw=1
set autoread
set hidden
set spelllang=en_us
set noshowmatch
set number relativenumber
set splitright
set clipboard=unnamed
set undofile
set undodir=~/.vim/tmp/undo
set noincsearch
set wildmenu
set wildmode=longest,full:list
set completeopt=menu,longest,preview
set sessionoptions=blank,buffers,curdir,folds,globals,help,localoptions,tabpages,winsize,terminal
if isdirectory(@%) == 1
  cd %
endif
let &path=getcwd()


" ==========
" Formatting
" ==========
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

filetype on
if version >= 600
  filetype plugin indent on
endif

autocmd FileType c,cpp
      \ setlocal equalprg=clang-format\ -style=microsoft
      \| setlocal tabstop=4
      \| setlocal softtabstop=4
      \| setlocal shiftwidth=4
autocmd FileType go
      \ setlocal equalprg=gofmt
      \| setlocal tabstop=2
      \| setlocal softtabstop=2
      \| setlocal shiftwidth=2
autocmd FileType *
      \ setlocal formatoptions-=cro

fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun
autocmd BufWritePre *
      \ call TrimWhitespace()


" ================
" Key binds/remaps
" ================
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
command W w
command Q q
command WQ wq
command Wq wq
vnoremap < <gv
vnoremap > >gv
inoremap {<CR> {<CR>}<Esc>O
inoremap [<CR> [<CR>]<Esc>O
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle
