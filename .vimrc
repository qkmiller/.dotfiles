" =======
" Plugins
" =======
" https://github.com/junegunn/vim-plug

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
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


" =====================
" Color/visual settings
" ==============
set termguicolors
set t_Co=256
colorscheme codedark
set cursorline
" Force black background
hi Normal guibg=black ctermbg=black
hi nonText guibg=black ctermbg=black
hi EndOfBuffer guibg=black ctermbg=black
" Auto-complete menu colors
hi Pmenu guibg=grey guifg=black ctermbg=grey ctermfg=black
hi PmenuSel guibg=blue guifg=white ctermbg=blue ctermfg=white
" Wildmenu color
hi WildMenu guibg=blue guifg=white ctermbg=blue ctermfg=white
" Statusline colors
hi statusline guibg=grey guifg=black ctermbg=grey ctermfg=black
hi User1 guibg=red guifg=white ctermbg=red ctermfg=white
hi User2 guibg=black guifg=white ctermbg=black ctermfg=white
" Change Statusline color when entering/exiting insert mode
au InsertEnter *
      \ hi statusline guibg=blue guifg=white  ctermbg=blue ctermfg=white
au InsertLeave *
      \ hi statusline guibg=grey guifg=black ctermbg=grey ctermfg=black
" Clear, then set Spell-checking color groups
hi clear SpellBad
hi clear SpellCap
hi clear SpellRare
hi clear SpellLocal
hi SpellBad guibg=red guifg=white ctermbg=red ctermfg=white
hi SpellCap guibg=red guifg=white ctermbg=red ctermfg=white
hi SpellRare guibg=magenta guifg=black ctermbg=magenta ctermfg=black
hi SpellLocal guibg=grey guifg=black ctermbg=grey ctermfg=black


" ==========
" Statusline
" ==========
set statusline=%2*\ \ \ \ %*
set statusline+=%1*%r%*
set statusline+=%1*%M%*
set statusline+=\ "
set statusline+=%f
set statusline+=\ \ "
set statusline+=%P "
set statusline+=\ \ "
set statusline+=%y
set statusline+=%=
set statusline+=%v
set statusline+=\ \ "
set statusline+=0x%B
set statusline+=\ "


" ===========================
" Wildmenu/auto-complete menu
" ===========================
" Hide if there's only one option and show information
set completeopt=menu,longest,preview
set wildmenu
" Show list of options with wildmenu
set wildmode=longest,full:list



" ===================
" Syntax highlighting
" ===================
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


" =================
" NERDTree settings
" =================
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
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1


" ===========================
" Editing behavior/formatting
" ===========================
set autoread
" Copy to system clipboard
set clipboard=unnamed
" Persistent undo
set undofile
set undodir=~/.vim/tmp/undo
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set number relativenumber
set splitright
set hlsearch
set ignorecase
set smartcase
" Don't jump to search results before enter is pressed
set noincsearch
" Prevents cursor jumping when creating parentheses/brackets
set noshowmatch
set spelllang=en_us
" enable file type detection
filetype on
if version >= 600
  filetype plugin indent on
endif
" Trim trailing spaces on save
fun! TrimWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun
autocmd BufWritePre *
      \ call TrimWhitespace()
" Set formatting programs per file-type
autocmd FileType c,cpp
      \ setlocal equalprg=clang-format\ -style=microsoft
autocmd FileType go
      \ setlocal equalprg=gofmt
" Turn off auto-comment for new lines in all files
autocmd FileType *
      \ setlocal formatoptions-=cro


" ================
" Key binds/remaps
" ================
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
" Indent lines/blocks with < >
vnoremap < <gv
vnoremap > >gv
" Auto create/format brackets
inoremap {<CR> {<CR>}<Esc>O
inoremap [<CR> [<CR>]<Esc>O
" Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>
" Comment lines/blocks
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

