"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Basic setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set leader key to <Space>
let mapleader = " "
nnoremap <Space> <Nop>

" Set default language to english to avoid unicode related problems
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Reload the file automatically when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" Enable filetype plugins
filetype plugin on
filetype indent on

" Enable syntax highlighting
syntax enable

" Set default encoding
set encoding=utf8

" Set unix line terminators as default
set ffs=unix,dos,mac

" Set height of the command lines
set cmdheight=1

" Set scrolloff lines so that there is margin when moving vertically with j, k or C-d, C-u
set so=8

" Set normal backspace behavior
set backspace=eol,start,indent

" Set normal left/right cursor keys behavior
set whichwrap+=<,>,h,l

" Tell vim what the background color looks
set background=dark

" Set text width that makes linebreak happen
set tw=500

" Set the size of the status lines
set laststatus=2

" Enable wildmenu
set wildmenu

" Disable modeline
set nomodeline

" Enable ignorecase when searching
set ignorecase

" Enable smartcase when searching
set smartcase

" Hide buffer when it is abandoned
set hid

" Enable highlight searching
set hlsearch

" Enable incremental searching
set incsearch

" Avoid redraw while executing macros, etc. to boost performance
set lazyredraw

" Enable special characters for searching
set magic

" Enable highlighting of the matching bracket when cursor is over them
set showmatch

" Disable backup
set nobackup
set nowb
set noswapfile

" Enable 256 colors palette in gnome-terminal
set t_Co=256

" Disable menu bar, toolbar, GUI tablines, scroll bars
" Enable 256 colors palette
if has("gui_running")
    set guioptions-=m
    set guioptions-=T
    set guioptions-=e
    set guioptions-=r
    set guioptions-=R
    set guioptions-=l
    set guioptions-=L
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Erase highlights
nnoremap <silent> <leader><cr> :noh<cr>

" Close the current window
nnoremap <leader>q :q<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab
  set stal=2
catch
endtry

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Toggle paste mode on and off
nnoremap <leader>p :setlocal paste!<cr>

set re=0
set redrawtime=66
