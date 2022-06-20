# vimrc

Its goal is to provide a simple, consistent, yet powerful set of enhancements suited for **using Vim as a general purpose editor**.<br />
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


## Additional setup for NeoVim users

To start the transition, run NeoVim and type below to create your init.vim file:

    :call mkdir(stdpath('config'), 'p')
    :exe 'edit '.stdpath('config').'/init.vim'

Then, add these contents to the file:

    set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = &runtimepath
    source ~/.vimrc


## Why yet another fork?

After long use of [amix-vimrc](https://github.com/amix/vimrc), a very well-crafted Vim configuration, I decided to create my version to support using Vim as a general purpose editor.<br /><br />
At first, I tried to find minimal subset working perfectly for the purpose. As being powerful, the former vimrc had functions that affected Vim's fundamental editing behavior in some use cases, like auto-completing parenthesis. Although it was useful in specific situations, it got in the way in some other cases.<br /><br />
Then, I rearranged its functionalities. From code development, analysis to note taking, Vim has a capability to accomplish all of them adequately if configured properly. There are some of plugins and key mappings added, changed, removed in the process. Also, as a 66-key keyboard user, I tried to minimize hand movements if equivalent tasks are capable of.<br /><br />
So, this is the result. As it is very opinionated towards a personal preference, I doubt how much of users will prefer this way, but I reveal this with my own efforts.


## A screenshot

<h1 align="center">
  <img src="https://user-images.githubusercontent.com/41180928/172978806-68ddf879-8003-4dc6-b6f5-ede374505863.png" width="600" />
</h1>


## Included plugins

* [NERDTree](https://github.com/preservim/nerdtree): A file system explorer for the Vim editor.
* [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim): Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
* [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors): Yet another attempt at bringing Sublime Text's multiple selection feature into Vim.
* [vimwiki](https://github.com/vimwiki/vimwiki): A personal wiki for Vim.
* [vim-table-mode](https://github.com/dhruvasagar/vim-table-mode): An awesome automatic table creator & formatter allowing one to create neat tables as you type.
* [vim-ripgrep](https://github.com/jremmen/vim-ripgrep): A line-oriented search tool that recursively searches the current directory for a regex pattern.
* [vim-signature](https://github.com/kshenoy/vim-signature): A plugin to place, toggle and display marks.
* [vim-expand-region](https://github.com/terryma/vim-expand-region): A Vim plugin that allows you to visually select increasingly larger regions of text using the same key combination.
* [vim-indent-object](https://github.com/michaeljsmith/vim-indent-object): Defines a new text object, based on indentation levels.
* [ale](https://github.com/dense-analysis/ale): A plugin providing linting (syntax checking and semantic errors) in NeoVim 0.2.0+ and Vim 8.
* [lightline.vim](https://github.com/itchyny/lightline.vim): A light and configurable statusline/tabline plugin for Vim.
* [vim-smoothie](https://github.com/psliwka/vim-smoothie): Smooth scrolling for Vim done right.
* [vim-fugitive](https://github.com/tpope/vim-fugitive): The premier Vim plugin for Git.
* [editorconfig-vim](https://github.com/editorconfig/editorconfig-vim): An EditorConfig plugin for Vim.
* [pathogen.vim](https://github.com/tpope/vim-pathogen): Manage your 'runtimepath' with ease.


## Included plugins (Vim only)

* [vim-vsnip](https://github.com/hrsh7th/vim-vsnip): VSCode(LSP)'s snippet feature in vim.


## Included plugins (NeoVim only)

* [LuaSnip](https://github.com/L3MON4D3/LuaSnip): A powerful snippet engine for NeoVim written in Lua.
* [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim): A highly extendable fuzzy finder over lists.


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
* [friendly-snippets](https://github.com/rafamadriz/friendly-snippets)


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

To open / move / navigate between tabs: `<leader>T`, `<leader>E` / `<leader>M` / `gt`, `gT`, `gz`
	
	nnoremap <leader>T :tabnew<cr>
	nnoremap <leader>M :tabmove 
    nnoremap gz :exe "tabn ".g:lasttab<cr>
	
	" Opens a new tab with the current buffer's path
	nnoremap <leader>E :tabedit <C-r>=expand("%:p:h")<cr>/

To close the current buffer(s): `<leader>bd`, `<leader>ba`
	
	" Close current buffer
	nnoremap <leader>bd :Bclose<cr>
	
	" Close all buffers
	nnoremap <leader>ba :1,1000 bd!<cr>
	

To save the current buffer: `<leader>bw`

    nnoremap <leader>bw :w<cr>


To close the current window: `<leader>q`

    nnoremap <leader>q :q<cr>

To move between windows: `<ctrl>j`, `<ctrl>k`, `<ctrl>h`, `<ctrl>l`
	
	nnoremap <C-j> <C-W>j
	nnoremap <C-k> <C-W>k
	nnoremap <C-h> <C-W>h
	nnoremap <C-l> <C-W>l

To disable highlights: `<leader>` `<cr>`
	
	nnoremap <silent> <leader><cr> :noh<cr>

To open [vim-ripgrep](https://github.com/jremmen/vim-ripgrep) for fast search between files: `<C-g>`
	
	nnoremap <C-g> :Rg 

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

[NERDTree](https://github.com/preservim/nerdtree) mappings: `<leader>n`, `<leader>C`

    nnoremap <leader>n :NERDTreeToggle<cr>
    nnoremap <leader>C :NERDTreeFind<cr>

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

To autocomplete via snippets with [vim-vsnip](https://github.com/hrsh7th/vim-vsnip) or [LuaSnip](https://github.com/L3MON4D3/LuaSnip): `<tab>`

[ale](https://github.com/dense-analysis/ale) to easily go to the next Ale syntax/lint error: `<leader>a`

    nnoremap <silent> <leader>a <Plug>(ale_next_wrap)

[vim-fugitive](https://github.com/tpope/vim-fugitive) to copy the link to the line of a Git repository to the clipboard: `<leader>v`

    nnoremap <leader>v :.GBrowse!<cr>
    xnoremap <leader>v :'<'>GBrowse!<cr>

[vim-wiki](https://github.com/vimwiki/vimwiki) to create a personal wiki in Vim: `<leader>ww`, `<leader>w<leader>w`, `<leader>wd`, `<leader>wr`, `<enter>`, `<backspace>` 

	" <leader>ww -- Open default wiki index file.
    " <leader>w<leader>w -- Open diary wiki-file for today.
	" <leader>wd -- Delete wiki file you are in. (only in wiki)
	" <leader>wr -- Rename wiki file you are in. (only in wiki)
	" <enter> -- Follow/Create wiki link. (only in wiki)
	" <backspace> -- Go back to parent(previous) wiki link. (only in wiki)

[vim-table-mode](https://github.com/dhruvasagar/vim-table-mode) to format table automatically: `<leader>tm`, `|`, `<leader>tdd`, `<leader>tdc`

    " <leader> tm -- Toggle table mode for the current buffer.
    " | -- Trigger table creation in table mode.
    " <leader> tdd -- Delete the entire table row you are on or multiple rows using a [count].
    " <leader> tdc -- Delete entire table column you are within or multiple columns using a [count].

[vim-signature](https://github.com/kshenoy/vim-signature) mappings:

    mx           Toggle mark 'x' and display it in the leftmost column
    m.           If no mark on line, place the next available mark. Otherwise, remove (first) existing mark.
    m<Space>     Delete all marks from the current buffer
    ]'           Jump to start of next line containing a mark
    ['           Jump to start of prev line containing a mark
    
When you search with [vim-ripgrep](https://github.com/jremmen/vim-ripgrep), display / move to next / move to previous with: `<leader>cc`, `<leader>j`, `<leader>k`

    nnoremap <leader>cc :botright cope<cr>
    nnoremap <leader>j :cnext<cr>
    nnoremap <leader>k :cprev<cr>


### NeoVim mappings

To open [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) plugin to find and preview files in current working directory: `<leader>f`, `<leader>g`

    nnoremap <leader>f :Telescope find_files<cr>
    nnoremap <leader>g :Telescope live_grep<cr>


## ripgrep

It is recommended to install [ripgrep](https://github.com/BurntSushi/ripgrep) to use [vim-ripgrep](https://github.com/jremmen/vim-ripgrep) and [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim).


## Font

    set gfn=IBM_Plex_Mono:h11:W200:cANSI:qDRAFT

For windows, [IBM Plex Mono](https://github.com/IBM/plex) is set to default. It is in **~/.vim_runtime/my_plugins.vim**.


## How to uninstall
Remove `~/.vim_runtime`, and please write your own `~/.vimrc`.
