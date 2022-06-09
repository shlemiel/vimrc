# shlemiel-vimrc

Its goal is to provide a simple, consistent set of enhancements suited for **general-purpose use of Vim**.
(This is a fork of the [amix-vimrc](https://github.com/amix/vimrc).)


## How to install?

	git clone https://github.com/shlemiel/vimrc ~/.vim_runtime
	sh ~/.vim_runtime/install_awesome_vimrc.sh

In windows, **git bash** is a preferred way to install.


## How to update to latest version?

    cd ~/.vim_runtime
    git reset --hard
    git clean -d --force
    git pull --rebase
    python update_plugins.py  # use python3 if python is unavailable

In case of `ModuleNotFoundError: No module named 'requests'`, please install `requests` python module first. (`pip` or `pip3`)

    pip install requests


## Why yet another fork?

From software, hardware development, code analysis to note taking, I try to do every daily job I can do with Vim.
Thanks to [amix-vimrc](https://github.com/amix/vimrc), very well-crafted Vim configuration, it has helped me a lot in performing those tasks.
But what I've learned from long term use is that sometimes it's better to reduce the number of tools.
The minimum set of tools is most powerful when mastered to the maximum.
Furthermore, there was an urge to apply careful adjustments to the set to provide consistency as much as possible for general-purpose use of Vim.
That is why I shamelessly offered this.


## Included plugins

* [NERDTree](https://github.com/preservim/nerdtree): A file system explorer for the Vim editor.
* [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim): Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
* [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors): Yet another attempt at bringing Sublime Text's multiple selection feature into Vim.
* [vim-wiki](https://github.com/vimwiki/vimwiki): A personal wiki for Vim.
* [calendar.vim](https://github.com/mattn/calendar-vim): Creates a calendar window you can use within Vim.
* [snipmate.vim](https://github.com/garbas/vim-snipmate): Aims to provide support for textual snippets, similar to TextMate or other Vim plugins like UltiSnips.
* [ack.vim](https://github.com/mileszs/ack.vim): Run your favorite search tool from Vim, with an enhanced results list.
* [vim-signature](https://github.com/kshenoy/vim-signature): A plugin to place, toggle and display marks.
* [vim-expand-region](https://github.com/terryma/vim-expand-region): A Vim plugin that allows you to visually select increasingly larger regions of text using the same key combination.
* [vim-indent-object](https://github.com/michaeljsmith/vim-indent-object): Defines a new text object, based on indentation levels.
* [goyo.vim](https://github.com/junegunn/goyo.vim): Distraction-free writing in Vim.
* [ale](https://github.com/dense-analysis/ale): A plugin providing linting (syntax checking and semantic errors) in NeoVim 0.2.0+ and Vim 8.
* [lightline.vim](https://github.com/itchyny/lightline.vim): A light and configurable statusline/tabline plugin for Vim.
* [vim-smoothie](https://github.com/psliwka/vim-smoothie): Smooth scrolling for Vim done right.
* [vim-fugitive](https://github.com/tpope/vim-fugitive): The premier Vim plugin for Git.
* [gist-vim](https://github.com/mattn/gist-vim): A vimscript for creating gists.
* [editorconfig-vim](https://github.com/editorconfig/editorconfig-vim): An EditorConfig plugin for Vim.
* [pathogen.vim](https://github.com/tpope/vim-pathogen): Manage your 'runtimepath' with ease.


## Included color schemes

* [dracula](https://github.com/dracula/vim): The default
* [awesome-vim-colorschemes](https://github.com/rafi/awesome-vim-colorschemes): Collection of awesome color schemes for Vim, merged for quick use.


## Included modes

* [vim-coffee-script](https://github.com/kchmck/vim-coffee-script)
* [vim-less](https://github.com/groenewege/vim-less)
* [vim-bundle-mako](https://github.com/sophacles/vim-bundle-mako)
* [vim-markdown](https://github.com/plasticboy/vim-markdown)
* [nginx.vim](https://github.com/vim-scripts/nginx.vim)
* [rust.vim](https://github.com/rust-lang/rust.vim)
* [vim-ruby](https://github.com/vim-ruby/vim-ruby)
* [typescript-vim](https://github.com/leafgarland/typescript-vim)
* [vim-javascript](https://github.com/pangloss/vim-javascript)
* [vim-python-pep8-indent](https://github.com/Vimjas/vim-python-pep8-indent)


## How to include your own stuff?

Your own settings could be written in **~/.vim_runtime/my_configs.vim**.
The file will be created once with default settings when you install. It won't be modified when performing updates.

    vim ~/.vim_runtime/my_configs.vim

You can install your own plugins in **~/.vim_runtime/my_plugins/**.

	cd ~/.vim_runtime/my_plugins
	git clone https://github.com/tpope/vim-surround.git


## Key mappings

### The `<leader>` key

It is mapped to `<Space>`.


### Normal mode mappings

To open / move / navigate between tabs: `<leader>tn`, `<leader>te` / `<leader>tm` / `gt`, `gT`, `gz`
	
	nnoremap <leader>tn :tabnew<cr>
	nnoremap <leader>tm :tabmove 
    nnoremap gz :exe "tabn ".g:lasttab<cr>
	
	" Opens a new tab with the current buffer's path
	nnoremap <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

To close the current buffer(s): `<leader>bd`, `<leader>ba`
	
	" Close current buffer
	nnoremap <leader>bd :Bclose<cr>
	
	" Close all buffers
	nnoremap <leader>ba :1,1000 bd!<cr>
	
To close the current window: `<leader>q`

    nnoremap <leader>q :q

To move between windows: `<ctrl>j`, `<ctrl>k`, `<ctrl>h`, `<ctrl>l`
	
	nnoremap <C-j> <C-W>j
	nnoremap <C-k> <C-W>k
	nnoremap <C-h> <C-W>h
	nnoremap <C-l> <C-W>l

To disable highlights: `<leader>` `<cr>`
	
	nnoremap <silent> <leader><cr> :noh<cr>

To set current working directory to the directory of the open buffer: `<leader>cd`
	
	nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>
	
To open [ack.vim](https://github.com/mileszs/ack.vim) for fast search between files: `<leader>g`
	
	nnoremap <leader>g :Ack 

To toggle paste mode on and off: `<leader>p`
	
	nnoremap <leader>p :setlocal paste!<cr>

To toggle the number column on and off: `<leader>s`

    nnoremap <leader>s :call SidebarToggle()<cr>

To move to the last character of the previous word: `<backslash>`

    nnoremap \ ge

To move to the last character of the previous word excluding punctuation: `<pipe>` (`<shift><backslash>`)

    nnoremap \| gE

To highlight a word under the cursor without move: `<comma>`

    nnoremap , :let @/='\<<C-R>=expand("<cword>")<cr>\>'<cr>


### Visual mode mappings

To move selected lines down, up, left, right: `<ctrl>j`, `<ctrl>k`, `<ctrl>h`, `<ctrl>l`

    vnoremap <C-j> :m '>+1<cr>gv=gv
    vnoremap <C-k> :m '<-2<cr>gv=gv
    vnoremap <C-h> <gv
    vnoremap <C-l> >gv

To search a word under the cursor forwards or backwards: `*`, `#`

	vnoremap <silent> * :call VisualSelection('f')<cr>
	vnoremap <silent> # :call VisualSelection('b')<cr>

To search and replace the selected text: `<leader>r`

	vnoremap <silent> <leader>r :call VisualSelection('replace')<cr>
    
    
### Insert mode mappings

To move the current line down, up, left, right: `<ctrl>j`, `<ctrl>k`, `<ctrl>h`, `<ctrl>l`

    inoremap <C-j> <Esc>:m .+1<cr>==gi
    inoremap <C-k> <Esc>:m .-2<cr>==gi
    inoremap <C-h> <Esc><<==gi
    inoremap <C-l> <Esc>>>==gi


### Plugin related mappings

[NERDTree](https://github.com/preservim/nerdtree) mappings: `<leader>n`, `<leader>f`, `<leader>b`

    nnoremap <leader>n :NERDTreeToggle<cr>
    nnoremap <leader>f :NERDTreeFind<cr>
    nnoremap <leader>b :NERDTreeFromBookmark 

To open [ctrlp.vim](https://github.com/kien/ctrlp.vim) plugin to quickly find a file or a buffer: `<ctrl>f`, `<ctrl>b`

    " Quickly find and open a file in the CWD
    let g:ctrlp_map = '<C-f>'

    " Quickly find and open a buffer
    nnoremap <C-b> :CtrlPBuffer<cr>

[vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors) mappings:

    let g:multi_cursor_start_word_key      = '<C-s>'
    let g:multi_cursor_next_key            = '<C-s>'
    let g:multi_cursor_prev_key            = '<C-p>'
    let g:multi_cursor_skip_key            = '<C-x>'
    let g:multi_cursor_quit_key            = '<Esc>'

To autocomplete via snippets with [vim-snipmate](https://github.com/garbas/vim-snipmate): `<tab>`

[goyo.vim](https://github.com/junegunn/goyo.vim) removes all the distractions and centers the content: `<leader>z`

    nnoremap <leader>z :Goyo<cr>

[ale](https://github.com/dense-analysis/ale) to easily go to the next Ale syntax/lint error: `<leader>a`

    nnoremap <silent> <leader>a <Plug>(ale_next_wrap)

[vim-fugitive](https://github.com/tpope/vim-fugitive) to copy the link to the line of a Git repository to the clipboard: `<leader>v`

    nnoremap <leader>v :.GBrowse!<cr>
    xnoremap <leader>v :'<'>GBrowse!<cr>

[vim-wiki](https://github.com/vimwiki/vimwiki) to create a personal wiki in Vim: `<leader>ww`, `<leader>wd`, `<leader>wr`, `<enter>`, `<backspace>` 

	" <leader>ww -- Open default wiki index file.
	" <leader>wd -- Delete wiki file you are in. (only in wiki)
	" <leader>wr -- Rename wiki file you are in. (only in wiki)
	" <enter> -- Follow/Create wiki link. (only in wiki)
	" <backspace> -- Go back to parent(previous) wiki link. (only in wiki)

[calendar.vim](https://github.com/mattn/calendar-vim) to open calendar window within Vim: `<leader>cal`, `<enter>`

    " <leader>cal -- Open calendar vertically
    " <enter> -- Open vimwiki diary with the day under the cursor

[vim-signature](https://github.com/kshenoy/vim-signature) mappings:

    mx           Toggle mark 'x' and display it in the leftmost column
    dmx          Remove mark 'x' where x is a-zA-Z

    m,           Place the next available mark
    m.           If no mark on line, place the next available mark. Otherwise, remove (first) existing mark.
    m-           Delete all marks from the current line
    m<Space>     Delete all marks from the current buffer
    ]`           Jump to next mark
    [`           Jump to prev mark
    ]'           Jump to start of next line containing a mark
    ['           Jump to start of prev line containing a mark
    `]           Jump by alphabetical order to next mark
    `[           Jump by alphabetical order to prev mark
    ']           Jump by alphabetical order to start of next line having a mark
    '[           Jump by alphabetical order to start of prev line having a mark
    m/           Open location list and display marks from current buffer

    m[0-9]       Toggle the corresponding marker !@#$%^&*()
    m<S-[0-9]>   Remove all markers of the same type
    ]-           Jump to next line having a marker of the same type
    [-           Jump to prev line having a marker of the same type
    ]=           Jump to next line having a marker of any type
    [=           Jump to prev line having a marker of any type
    m?           Open location list and display markers from current buffer
    m<BS>        Remove all markers
    
When you search with [ack.vim](https://github.com/mileszs/ack.vim), display your results in **cope** with: `<leader>cc`

    nnoremap <leader>cc :botright cope<cr>


## Font

    set gfn=IBM_Plex_Mono:h11:W200:cANSI:qDRAFT

For windows, [IBM Plex Mono](https://github.com/IBM/plex) is set to default. It is in **~/.vim_runtime/my_plugins.vim**.


## How to uninstall
Remove `~/.vim_runtime`, and please write your own `~/.vimrc`.
