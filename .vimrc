"  █░     ▄  ▄     ▄      ▄    ▄▄▄       ▄▄
"  ██▒   █▓  ██▓  ███▄ ▄███▓  ▐█▀███   ▄████▄
" ▓██░   █▒ ▓██▒ ▓██▒▀█▀ ██▒ ▓██ ▒ ██ ▒██▀  ▀
"  ▓██  ██░▒▒██▒ ▓██▒ ▐ ▓██░ ▓██ ░▄█▓ ▒██
"   ▒██▐█░░ ░██░ ▒██▒   ▒██  ▒██▓▀█▄▒ ▒▓█▒  ▄█▒
"    ▒▀█░   ░██░ ▒▐█▒ ░ ░▓█▒ ░██▓ ▒██▒░ ██▓█▀ ░
"    ░ ▐░   ░▓   ░▐▒░   ░ ▓░ ░▓▒░ ░▒▓░░ ░▒▓▒  ░
"    ░ ░░   ▒ ░░  ▐░      ░   ░▒   ▒░  ░▒ ▒
"      ░░   ▒ ░░  ░    ░      ░    ░ ░
"       ░   ░          ░             ░ ░
"      ░                            ░
"
" ==================
" Plugins (Vim-plug)
" ==================
call plug#begin('~/.vim/plugged')
Plug 'tomasiser/vim-code-dark'
Plug 'lifepillar/vim-solarized8'
Plug 'preservim/nerdtree'
Plug 'wikitopian/hardmode'
Plug 'scrooloose/nerdcommenter'
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
call plug#end()


" ==============
" Color settings
" ==============
set termguicolors
set background=dark
set cursorline
set hlsearch
colorscheme solarized8_flat
hi Pmenu gui=NONE cterm=NONE guibg=darkgrey guifg=black ctermbg=darkgrey ctermfg=black
hi PmenuSel gui=NONE cterm=NONE guibg=blue guifg=white ctermbg=blue ctermfg=white
hi WildMenu gui=NONE cterm=NONE guibg=blue guifg=white ctermbg=blue ctermfg=white
hi TabLineSel gui=NONE cterm=NONE guibg=blue guifg=white ctermbg=blue ctermfg=white
hi StatusLine gui=bold cterm=bold guibg=darkgrey guifg=black ctermbg=darkgrey ctermfg=black
hi User1 gui=NONE cterm=NONE guibg=red guifg=white ctermbg=red ctermfg=white
hi SpellBad guibg=red guifg=white ctermbg=red ctermfg=white
hi SpellCap guibg=red guifg=white ctermbg=red ctermfg=white
hi SpellRare guibg=magenta guifg=black ctermbg=magenta ctermfg=black
hi SpellLocal guibg=darkgrey guifg=black ctermbg=darkgrey ctermfg=black
hi Terminal guibg=black ctermbg=black

if g:colors_name == "codedark"
  hi Normal guibg=black ctermbg=black
  hi NonText guibg=black ctermbg=black
  hi EndOfBuffer guibg=black ctermbg=black
endif

au InsertEnter *
      \ hi StatusLine guibg=blue guifg=white  ctermbg=blue ctermfg=white
au InsertLeave *
      \ hi StatusLine guibg=darkgrey guifg=black  ctermbg=darkgrey ctermfg=black


" ==========
" Statusline
" ==========
set statusline=%1*%r%*
set statusline+=\ "
set statusline+=%f
set statusline+=%=
set statusline+=line\ %l\  "
set statusline+=of
set statusline+=\ %L "
set statusline+=\ \ \ \ "
set statusline+=col:\ %v
set statusline+=\ \ \ \ "
set statusline+=hex:\ 0x%B
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


" ================
" Editing behavior
" ================
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
set ignorecase
set smartcase
set wildmenu
set wildmode=longest,full:list
set completeopt=menu,preview
set sessionoptions=blank,buffers,curdir,folds,globals,help,localoptions,tabpages,winsize,terminal

if isdirectory(@%) == 1
  cd %
endif
let &path=getcwd()
set path+=**

autocmd BufEnter *
      \ if (winnr("$") == 1
      \ && exists("b:NERDTree")
      \ && b:NERDTree.isTabTree())
      \| q
      \| endif


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

fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

autocmd BufWritePre *
      \ call TrimWhitespace()
autocmd FileType c,cpp
      \ setlocal equalprg=clang-format\ -style=google
      \| let g:syntastic_cpp_compiler_options = '-std=c++11'
autocmd FileType go
      \ setlocal equalprg=gofmt
autocmd FileType *
      \ setlocal formatoptions-=cro


" ============
" Key/command mappings
" ============
let mapleader =" "
let NERDTreeMapOpenVSplit = 'v'
let NERDTreeMapOpenSplit = 's'
nnoremap <leader><Space> :NERDTreeToggle<CR>
nnoremap <Space> <nop>
nnoremap <leader>= gg=G2<C-O>
nnoremap <leader>t :term<CR>
nnoremap <leader>] :bn<CR>
nnoremap <leader>[ :bp<CR>
nnoremap <leader>1 :b1<CR>
nnoremap <leader>2 :b2<CR>
nnoremap <leader>3 :b3<CR>
nnoremap <leader>4 :b4<CR>
nnoremap <leader>5 :b5<CR>
nnoremap <leader>6 :b6<CR>
nnoremap <leader>7 :b7<CR>
nnoremap <leader>8 :b8<CR>
nnoremap <leader>9 :b9<CR>
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>h <C-W>h
nnoremap <leader>l <C-W>l
command W w
command Q q
command WQ wq
command Wq wq
vnoremap < <gv
vnoremap > >gv
inoremap {<CR> {<CR>}<Esc>O
inoremap [<CR> [<CR>]<Esc>O
inoremap (<CR> (<CR>)<Esc>O
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle
