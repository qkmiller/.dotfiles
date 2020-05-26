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


" ==============================================================================
" Plugins (Vim-plug)
" ==============================================================================
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'wikitopian/hardmode'
Plug 'vim-syntastic/syntastic'
Plug 'tomasiser/vim-code-dark'
Plug 'jeffkreeftmeijer/vim-dim'
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


" ==============================================================================
" Color Settings
" ==============================================================================
if has('termguicolors')
  set termguicolors
endif

set background=dark
colorscheme codedark
set cursorline
set hlsearch

hi Comment cterm=italic gui=italic
hi Pmenu gui=NONE guibg=grey guifg=black
hi Pmenu cterm=NONE ctermbg=grey ctermfg=black
hi PmenuSel gui=NONE guibg=blue guifg=white
hi PmenuSel cterm=NONE ctermbg=blue ctermfg=white
hi StatusLine gui=NONE guibg=white guifg=black
hi StatusLine cterm=NONE ctermbg=white ctermfg=black
hi StatusLineTerm gui=NONE guibg=white guifg=black
hi StatusLineTerm cterm=NONE ctermbg=white ctermfg=black
hi StatusLineNC gui=NONE guibg=grey42 guifg=black
hi StatusLineNC cterm=NONE ctermbg=243 ctermfg=black
hi SpellBad guibg=red guifg=white
hi SpellBad ctermbg=red ctermfg=white
hi SpellCap guibg=red guifg=white
hi SpellCap ctermbg=red ctermfg=white
hi SpellRare guibg=magenta guifg=black
hi SpellRare ctermbg=magenta ctermfg=black
hi SpellLocal guibg=grey guifg=black
hi SpellLocal ctermbg=grey ctermfg=black
hi TabLineSel gui=NONE guibg=grey guifg=black
hi TabLineSel cterm=NONE ctermbg=grey ctermfg=black
hi Terminal guibg=black
hi Terminal ctermbg=black
hi WildMenu gui=NONE guibg=blue guifg=white
hi WildMenu cterm=NONE ctermbg=blue ctermfg=white

let g:go_highlight_build_constraints=1
let g:go_highlight_functions=1
let g:go_highlight_methods=1
let g:go_highlight_operators=1
let g:go_highlight_structs=1
let g:go_highlight_variable_assignments=1
let g:go_highlight_variable_declarations=1
let g:go_mod_fmt_autosave=1
let g:sql_type_default='pgsql'

" Fixes terminal colors when termguicolors is enabled for some colorschemes
if exists('g:terminal_ansi_colors')
  unlet g:terminal_ansi_colors
endif

" Gets current value of a given highlight group
fun! GetHighlight(group)
  let highlight_value = execute('hi ' . a:group)
  let items = split(highlight_value,  'xxx ')
  return items[1]
endfun

" Changes the cursor line background to black when in insert mode.
augroup vimrc_insert_mode
  let g:current_cursorline_color = GetHighlight('CursorLine')
  au InsertEnter * hi CursorLine guibg=black ctermbg=black
  au InsertLeave * execute('hi CursorLine ' . g:current_cursorline_color)
augroup end

" Changes cursorline and statusbar when entering / leaving a window
augroup vimrc_window
  au WinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup end


" ==============================================================================
" Statusline
" ==============================================================================
set statusline=\ %f\ %r%=lines:\ %l\ /\ %L\ \ \ \ col:\ %v\ \ \ \ hex:\ 0x%B\ "

" Only shows info on the right side for the currently selected window and
" override NERDTree's statusline
augroup vimrc_statusline
  au WinEnter * if exists('b:NERDTree') == 0
            \| setlocal statusline=
            \| endif
  au WinLeave * if exists('b:NERDTree') == 0
          \| setlocal statusline=\ %f
          \| endif
augroup end


" ==============================================================================
" Formatting
" ==============================================================================
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

fun! TrimWhitespace()
  let l:save=winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

fun! CPPFormatSettings()
  setlocal equalprg=clang-format\ -style=google
  setlocal makeprg=mingw32-make.exe
  let g:syntastic_cpp_compiler_options='-std=c++11'
endfun

fun! GoFormatSettings()
  setlocal equalprg=gofmt
endfun

fun! DefaultFormatSettings()
  setlocal formatoptions-=ro
endfun

fun! MarkdownFormatSettings()
  setlocal formatoptions+=tcro
endfun

augroup vimrc_formatting
  autocmd BufWritePre * call TrimWhitespace()
  autocmd FileType c,cpp call CPPFormatSettings()
  autocmd FileType go call GoFormatSettings()
  autocmd FileType * call DefaultFormatSettings()
  autocmd FileType markdown call MarkdownFormatSettings()
augroup end


" ==============================================================================
" Editing Behavior / Miscellaneous Settings / Helper-functions
" ==============================================================================
set autoread
set clipboard=unnamed
set completeopt=menu,preview
set hidden
set lazyredraw
set linebreak breakindent breakat=\ ^I!@*-+;:,./?(){}[]\\" showbreak=!>>>
set noincsearch ignorecase smartcase
set nomodeline modelines=0
set noshowmatch
set number relativenumber
set scrolloff=10
set spelllang=en_us
set splitright splitbelow
set undofile undodir=~/.vim/tmp/undo
set wildignore=*.o,*.obj,*.swp,node_modules,.git,*.exe
set wildmenu wildmode=longest,full:list
set sessionoptions=buffers
      \,curdir
      \,folds
      \,globals
      \,help
      \,localoptions
      \,tabpages

let NERDTreeRespectWildIgnore=1

" Prevents NERDTree from opening twice in some cases
let g:NERDTreeHijackNetrw=0

" Prevents Netrw from being loaded during startup
let g:loaded_netrw=1

let g:notes_file='~/.vim/notes.txt'
let g:vimrc='~/.vim/vimrc'
let g:vimrc_istoggled=0

" Close NERDTree if all other buffers have been closed
fun! NERDTreeAutoClose()
  if (winnr('$') == 1
        \ && exists('b:NERDTree'))
    q
  endif
endfun

" Opens / closes the notes file specified in g:notes_file
fun! ToggleNotes()
  let win_number = bufwinnr(g:notes_file)
  if win_number != -1
    execute(win_number . 'wincmd w')
    silent update
    q
  else
    execute('sp ' . g:notes_file)
    wincmd J
    $
    if getline(".") != ""
      normal o
    endif
    setlocal keywordprg=:help
  endif
endfun

" If a directory is opened and a session exists, load it, then open NERDTree
fun! LoadSession()
  if argc() == 1
        \ && isdirectory(argv()[0])
        \ && findfile('Session.vim') == 'Session.vim'
    source ./Session.vim
    execute('NERDTreeToggle')
  endif
endfun

" If a directory is opened, start NERDTree and set path / workspace
fun! OpenDirectory()
  if (argc() == 1
        \ && isdirectory(argv()[0])
        \ && !exists('s:std_in'))
    execute('NERDTree ' . argv()[0])
    wincmd p
    execute('cd ' . argv()[0])
    let &path=getcwd()
    wincmd p
  endif
endfun

" If a directory is opened and a session exists, save it before closing
fun! SaveSession()
  execute('NERDTreeClose')
  if (argc() == 1 && isdirectory(argv()[0])
        \ && winnr("$") > 1
        \ && findfile('Session.vim') == 'Session.vim')
    mksession!
  endif
endfun

fun! CreateSnippet(snippet, prompt)
  let old_line_count = line('$')
  silent call inputsave()
  let name = input(a:prompt)
  silent call inputrestore()
  execute('0read ~/.vim/snippets/' . a:snippet)
  let snippet_line_count = line('$') - old_line_count
  execute('.,+' . snippet_line_count . 's/' . a:snippet . '/' . name)
  return ''
endfun


augroup vimrc_editing
  autocmd BufEnter * call NERDTreeAutoClose()
  autocmd VimEnter * call OpenDirectory() | call LoadSession()
  autocmd VimLeavePre * call SaveSession()
augroup end


" ==============================================================================
" Keymaps / Commands / Abbreviations:
" ==============================================================================
let mapleader=" "
let NERDTreeMapOpenVSplit='v'
let NERDTreeMapOpenSplit='s'
let NERDTreeShowHidden=1

"Normal mode
nnoremap <Space> <nop>
nnoremap <leader><CR> o<Esc>
nnoremap <silent> <leader><Tab> :NERDTreeToggle<CR>
nnoremap <silent> <leader>` :call ToggleNotes()<CR>
nnoremap <leader>= gg=G2<C-O>
nnoremap <silent> <leader>t :wincmd b \| bel term<CR>git status<CR>
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
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nmap ++ <plug>NERDCommenterToggle

" Command mode
command W w
command Q q
command WQ wq
command Wq wq
command Vimrc tabnew ~/.vim/vimrc

" Visual mode
vnoremap < <gv
vnoremap > >gv
vmap ++ <plug>NERDCommenterToggle

" Insert mode
inoremap {<CR> {<CR>}<Esc>O
inoremap [<CR> [<CR>]<Esc>O
inoremap (<CR> (<CR>)<Esc>O
inoreabbrev DATETIME <C-R>=strftime("%c")<CR>
inoreabbrev REACTCOMPONENT <C-R>=CreateSnippet('ReactComponent', 'Name: ')
      \<CR><Esc>{{i<Tab><Tab><Tab>
