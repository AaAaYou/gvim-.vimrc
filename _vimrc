"===========================================
"    __          _                _ _ _
"   / _|_ __ ___(_) __      _____(_) (_)
"  | |_| '__/ _ \ | \ \ /\ / / _ \ | | |
"  |  _| | |  __/ |  \ V  V /  __/ | | |
"  |_| |_|  \___|_|___\_/\_/ \___|_|_|_|
"                |_____|
"
"=======VIM function comments===============
" copy from vim to system : Shift+V --> choose copy block --> input":y+"
" copy from system to vim : Enter insert --> shift+insert

let mapleader=" "
syntax on
set number
set relativenumber
set cursorline
set wrap
set showcmd
set wildmenu

set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

filetype off
set mouse=a
set encoding=utf-8
let &t_ut=''
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set list
set listchars=tab:?\ ,trail:?
set scrolloff=5

" ==================== build-in _vimrc==================
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

" =========================================================

" Press space twice to jump to the next '<++>' and edit it
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4i

" Spelling Check with <space>sc
hi clear SpellBad
hi SpellBad cterm=underline
map <LEADER>sc :set spell!<CR>

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

set guifont=Consolas:h13
:set lines=35 columns=120
colorscheme desert

map <LEADER>rc :e C:\Users\cn1341\gVimPortable\Data\settings\_vimrc<CR>

"=========keyboard map=======================
noremap = nzz
noremap - Nzz
noremap <LEADER><CR> :nohlsearch<CR>

"New direction key
"noremap n h
"noremap u k
"noremap e j
"noremap i l

"noremap k i
"noremap l u

map s <nop>
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>

"split screen different directory
map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>

map <LEADER>l <C-W>l
map <LEADER>k <C-W>k
map <LEADER>h <C-W>h
map <LEADER>j <C-W>j

map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

map tj :tabe<CR>
map th :-tabnext<CR>
map tl :+tabnext<CR>


"============ vim-vundle plugin install==================
