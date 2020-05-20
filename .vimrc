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


" Plugins (Vim-plug)
" ==============================================================================
call plug#begin('~/.vim/plugged')
Plug 'tomasiser/vim-code-dark'
Plug 'morhetz/gruvbox'
Plug 'lifepillar/vim-solarized8'
Plug 'preservim/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'wikitopian/hardmode'
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


" Color settings
" ==============================================================================
if has('termguicolors')
  set termguicolors
endif

set cursorline
set hlsearch
set background=dark
colorscheme solarized8

hi Pmenu gui=NONE guibg=grey guifg=black
hi Pmenu cterm=NONE ctermbg=grey ctermfg=black
hi PmenuSel gui=NONE guibg=blue guifg=white
hi PmenuSel cterm=NONE ctermbg=blue ctermfg=white
hi WildMenu gui=NONE guibg=blue guifg=white
hi WildMenu cterm=NONE ctermbg=blue ctermfg=white
hi TabLineSel gui=NONE guibg=grey guifg=black
hi TabLineSel cterm=NONE ctermbg=grey ctermfg=black
hi StatusLine gui=NONE guibg=grey guifg=black
hi StatusLine cterm=NONE ctermbg=grey ctermfg=black
hi SpellBad guibg=red guifg=white
hi SpellBad ctermbg=red ctermfg=white
hi SpellCap guibg=red guifg=white
hi SpellCap ctermbg=red ctermfg=white
hi SpellRare guibg=magenta guifg=black
hi SpellRare ctermbg=magenta ctermfg=black
hi SpellLocal guibg=grey guifg=black
hi SpellLocal ctermbg=grey ctermfg=black
hi Terminal guibg=black
hi Terminal ctermbg=black

" Fixes terminal colors when termguicolors is enabled
unlet g:terminal_ansi_colors

fun! GetHighlight(group)
  let highlight_value = execute('hi ' . a:group)
  let items = split(highlight_value,  'xxx ')
  return items[1]
endfun

" Changes the cursor line background to black when in insert mode.
" When leaving insert mode, the cursor line will go back to it's original state.
augroup insert_mode
  let g:current_cursorline_color = GetHighlight('CursorLine')
  au InsertEnter * hi CursorLine guibg=black ctermbg=black
  au InsertLeave * execute('hi CursorLine ' . g:current_cursorline_color)
augroup end


" Statusline
" ==============================================================================
set statusline=%L
set statusline+=\ "
set statusline+=%f
set statusline+=\ "
set statusline+=%r
set statusline+=%=
set statusline+=col:\ %v
set statusline+=\ \ \ \ "
set statusline+=hex:\ 0x%B
set statusline+=\ "


" Syntax highlighting
" ==============================================================================
let g:go_highlight_structs=1
let g:go_highlight_methods=1
let g:go_highlight_functions=1
let g:go_highlight_operators=1
let g:go_highlight_variable_declarations=1
let g:go_highlight_variable_assignments=1
let g:go_highlight_build_constraints=1
let g:go_mod_fmt_autosave=1
let g:sql_type_default='pgsql'


" Editing behavior / General settings
" ==============================================================================
set autoread
set hidden
set spelllang=en_us
set noshowmatch
set number relativenumber
set splitright
set splitbelow
set clipboard=unnamed
set undofile
set undodir=~/.vim/tmp/undo
set noincsearch
set ignorecase
set smartcase
set wildmenu
set wildmode=longest,full:list
set completeopt=menu,preview
set sessionoptions=buffers
      \,curdir
      \,folds
      \,globals
      \,help
      \,localoptions
      \,tabpages
      \,winsize
      \,terminal

" Prevents Netrw from being loading
let g:loaded_netrw=1

" Prevents NERDTree from opening twice in some cases
let g:NERDTreeHijackNetrw=0

" If a directory is opened, start NERDTree and set path / workspace
fun! OpenDirectory()
  if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in")
    exe 'NERDTree' argv()[0]
    wincmd p
    enew
    execute 'cd '.argv()[0]
    let &path=getcwd()
    wincmd p
  endif
endfun

fun! CloseLastNERDTree()
  if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree())
    q
  endif
endfun

" If a directory is opened and a session exists, save it before closing
fun! DirectorySaveSession()
  if isdirectory(argv()[0]) && findfile('Session.vim') == 'Session.vim'
    execute('mksession!')
  endif
endfun

" If a directory is opened and a session exists, load it and open NERDTree
fun! DirectoryLoadSession()
  if isdirectory(argv()[0]) && findfile('Session.vim') == 'Session.vim'
    source ./Session.vim
    execute('NERDTreeToggle')
  endif
endfun

augroup editing
  autocmd BufEnter * call CloseLastNERDTree()
  autocmd VimEnter * call OpenDirectory() | call DirectoryLoadSession()
  autocmd VimLeavePre * call DirectorySaveSession()
augroup end


" Formatting
" ==============================================================================
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set makeprg=mingw32-make.exe
filetype on

if version >= 600
  filetype plugin indent on
endif

fun! TrimWhitespace()
  let l:save=winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

fun! CPPFormatSettings()
  setlocal equalprg=clang-format\ -style=google
  let g:syntastic_cpp_compiler_options='-std=c++11'
endfun

fun! GoFormatSettings()
  setlocal equalprg=gofmt
endfun

fun! AllFormatSettings()
" Disables auto-comment on new lines
  setlocal formatoptions-=cro
endfun

augroup formatting
  autocmd BufWritePre * call TrimWhitespace()
  autocmd FileType c,cpp call CPPFormatSettings()
  autocmd FileType go call GoFormatSettings()
  autocmd FileType * call AllFormatSettings()
augroup end


" Key / command mappings
" ==============================================================================
let mapleader=" "
let NERDTreeMapOpenVSplit='v'
let NERDTreeMapOpenSplit='s'
let NERDTreeShowHidden=1
nnoremap <leader><Tab> :NERDTreeToggle<CR>
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

" Quinn Miller
" 5/20/2020
