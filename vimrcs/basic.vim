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

" Set command line history count
set history=500

" Set height of the command lines
set cmdheight=1

" Set scrolloff lines so that there is margin when moving vertically with j, k or C-d, C-u
set so=8

" Set normal backspace behavior
set backspace=eol,start,indent

" Set normal left/right cursor keys behavior
set whichwrap+=<,>,h,l

" Set tenths of a second to blink when matching brackets
set mat=2

" Tell vim what the background color looks
set background=dark

" Set text width that makes linebreak happen
set tw=500

" Set the size of the status lines
set laststatus=2

" Set the format of the status lines
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

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

" Enable word wrap
set lbr

" Enable wrap
set wrap

" Exclude well-known non-ASCII files and data files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Turn off error sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500

if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" Enable 256 colors palette in gnome-terminal
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

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

" Search for current selection in visual mode
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Highlight a word under the cursor without move in normal mode
nnoremap , :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>

" Erase highlights
nnoremap <silent> <leader><cr> :noh<cr>

" Move between windows
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-h> <C-W>h
nnoremap <C-l> <C-W>l

" Move to the last character of the previous word
nnoremap \ ge
nnoremap \| gE

" Close the current window
nnoremap <leader>q :q<cr>

" Close the current buffer
nnoremap <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
nnoremap <leader>ba :bufdo bd<cr>

" Tab related mappings (cf. gz to switch to the last tab)
nnoremap <leader>T :tabnew<cr>
nnoremap <leader>M :tabmove
nnoremap <leader>E :tabedit <C-r>=expand("%:p:h")<cr>/
let g:lasttab = 1
nnoremap gz :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Switch CWD to the directory of the open buffer
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Move the current line of text in insert mode
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
inoremap <C-h> <C-d>
inoremap <C-l> <C-t>

" Move selected lines of text in visual mode
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap <C-h> <gv
vnoremap <C-l> >gv

" Toggle paste mode on and off
map <leader>p :setlocal paste!<cr>

" Search and replace selected text in visual mode
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
