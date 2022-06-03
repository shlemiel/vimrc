![VIM](https://dnp4pehkvoo6n.cloudfront.net/43c5af597bd5c1a64eb1829f011c208f/as/Ultimate%20Vimrc.svg)

# The Ultimate vimrc

This is a fork of the [amix-vimrc](https://github.com/amix/vimrc), to provide **minimal set of enhancements for general-purpose use of vim**.

### Install for your own user only

	git clone --depth=1 https://github.com/shlemiel/vimrc.git ~/.vim_runtime
	sh ~/.vim_runtime/install_awesome_vimrc.sh
	
## How to install on Windows?

Please use git bash.

## How to update to latest version?

Just do a git rebase!

    cd ~/.vim_runtime
    git reset --hard
    git clean -d --force
    git pull --rebase
    python update_plugins.py  # use python3 if python is unavailable

NOTE: If you get `ModuleNotFoundError: No module named 'requests'`, you must first install the `requests` python module using `pip`, `pip3`, or `easy_install`.

    pip install requests

## What's changed?

* Added vim-smoothie, vim-wiki, calendar.vim
* Added mapping of gz to switch to last tab
* Added `<Ctrl-b>` mapping to open the ctrlp buffer (omitted in original vimrc)
* Added default settings in my_configs.vim (number, relativenumber, cursorcolumn, showcmd, ...)

* Removed auto-pairs, bufexplorer, mru.vim, open_file_under_cursor, vim-commentary, vim-surround, vim-yankstack, vim-zenroom2
* Removed :W (:w is often mistyped. Run vim as sudo to edit special files.)
* Removed Key mappings related to buffer navigation (Use tabs instead of buffers.)
* Removed to, tc (Directly close buffers when closing tabs.)
* Removed foldcolumn=1 (Convinient when copy-pasting on remote terminal.)
* Removed mapping of F5 to compilation (Use build scripts on a dedicated terminal.)
* Removed mapping of ,w
* Removed mapping of to and tc
* Removed mapping of 0 to ^
* Removed mapping of ,j and `<C-j>`
* Removed automatic cleaning of trailing white spaces
* Removed bracket autocompletion
* Removed xdate
* Removed mapping of Space, C-Space to searches
* Removed some of mappings of vim-multiple-cursors


## Included Plugins

I recommend reading the docs of these plugins to understand them better. Each plugin provides a much better Vim experience!

* [ack.vim](https://github.com/mileszs/ack.vim): Vim plugin for `the_silver_searcher` (ag) or ack -- a wicked fast grep
* [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim): Fuzzy file, buffer, mru and tag finder. It's mapped to `<Ctrl+F>`
* [goyo.vim](https://github.com/junegunn/goyo.vim): Distraction-free writing in vim
* [lightline.vim](https://github.com/itchyny/lightline.vim): A light and configurable statusline/tabline for Vim
* [NERD Tree](https://github.com/preservim/nerdtree): A tree explorer plugin for vim
* [pathogen.vim](https://github.com/tpope/vim-pathogen): Manage your vim runtimepath 
* [snipmate.vim](https://github.com/garbas/vim-snipmate): snipmate.vim aims to be a concise vim script that implements some of TextMate's snippets features in Vim
* [ale](https://github.com/dense-analysis/ale): Syntax and lint checking for vim (ALE requires NeoVim >= 0.2.0 or Vim 8 with +timers +job +channel)
* [vim-expand-region](https://github.com/terryma/vim-expand-region): Allows you to visually select increasingly larger regions of text using the same key combination
* [vim-fugitive](https://github.com/tpope/vim-fugitive): A Git wrapper so awesome, it should be illegal
* [vim-indent-object](https://github.com/michaeljsmith/vim-indent-object): Defines a new text object representing lines of code at the same indent level. Useful for python/vim scripts
* [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors): Sublime Text style multiple selections for Vim, CTRL+N is remapped to CTRL+S (due to YankRing)
* [gist-vim](https://github.com/mattn/gist-vim) Easily create gists from Vim using the `:Gist` command
* [vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides) Is a plugin for visually displaying indent levels in Vim
* [editorconfig-vim](https://github.com/editorconfig/editorconfig-vim) EditorConfig helps maintain consistent coding styles for multiple developers working on the same project across various editors and IDEs.
* [vim-smoothie](https://github.com/psliwka/vim-smoothie) Smooth scrolling for Vim done right
* [vim-wiki](https://github.com/vimwiki/vimwiki) A personal wiki for vim
* [calendar.vim](https://github.com/mattn/calendar-vim) creates a calendar window you can use within vim.


## Included color schemes

* [dracula](https://github.com/dracula/vim): The default
* [awesome-vim-colorschemes](https://github.com/rafi/awesome-vim-colorschemes)


## Included modes

* [vim-coffee-script](https://github.com/kchmck/vim-coffee-script)
* [vim-less](https://github.com/groenewege/vim-less)
* [vim-bundle-mako](https://github.com/sophacles/vim-bundle-mako)
* [vim-markdown](https://github.com/plasticboy/vim-markdown)
* [nginx.vim](https://github.com/vim-scripts/nginx.vim): Highlights configuration files for nginx
* [rust.vim](https://github.com/rust-lang/rust.vim)
* [vim-ruby](https://github.com/vim-ruby/vim-ruby)
* [typescript-vim](https://github.com/leafgarland/typescript-vim)
* [vim-javascript](https://github.com/pangloss/vim-javascript)
* [vim-python-pep8-indent](https://github.com/Vimjas/vim-python-pep8-indent)


## How to include your own stuff?

After you have installed the setup, you can create **~/.vim_runtime/my_configs.vim** to fill in any configurations that are important for you.

You can also install your plugins, for instance, via pathogen you can install [vim-rails](https://github.com/tpope/vim-rails):

	cd ~/.vim_runtime
	git clone git://github.com/tpope/vim-rails.git my_plugins/vim-rails

You can also install plugins without any plugin manager (vim 8+ required):  
	Add `packloadall` to your .vimrc file  
	Create pack plugin directory:  
	`mkdir -p ~/.vim/pack/plugins/start`  
	Clone the plugin that you want in that directory, for example:  
	`git clone --depth=1 git://github.com/maxmellon/vim-jsx-pretty  ~/.vim/pack/plugins/vim-jsx-pretty`


## Key Mappings

The [leader](http://learnvimscriptthehardway.stevelosh.com/chapters/06.html#leader) is `,`, so whenever you see `<leader>` it means `,`.


### Normal mode mappings

Disable highlights when you press `<leader><cr>`:
	
	map <silent> <leader><cr> :noh<cr>

Smart way to move between windows (`<ctrl>j` etc.):
	
	map <C-j> <C-W>j
	map <C-k> <C-W>k
	map <C-h> <C-W>h
	map <C-l> <C-W>l

Closing of the current buffer(s) (`<leader>bd` and (`<leader>ba`)):
	
	" Close current buffer
	map <leader>bd :Bclose<cr>
	
	" Close all buffers
	map <leader>ba :1,1000 bd!<cr>
	
Useful mappings for managing tabs:
	
	map <leader>tn :tabnew<cr>
	map <leader>tm :tabmove 
    nmap gz :exe "tabn ".g:lasttab<CR>
	
	" Opens a new tab with the current buffer's path
	" Super useful when editing files in the same directory
	map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/
	
Switch [CWD](http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file) to the directory of the open buffer:
	
	map <leader>cd :cd %:p:h<cr>:pwd<cr>
	
Open `ack.vim` for fast search:
	
	map <leader>g :Ack 

Toggle paste mode on and off:
	
	map <leader>pp :setlocal paste!<cr>


### Visual mode mappings

Visual mode pressing `*` or `#` searches for the current selection:

	vnoremap <silent> * :call VisualSelection('f')<CR>
	vnoremap <silent> # :call VisualSelection('b')<CR>

When you press `<leader>r` you can search and replace the selected text:

	vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>


### Plugin related mappings

Open [ctrlp.vim](https://github.com/kien/ctrlp.vim) plugin to quickly find a file or a buffer (`<ctrl>f`, `<ctrl>b`):

    " Quickly find and open a file in the CWD
    let g:ctrlp_map = '<C-f>'

    " Quickly find and open a buffer
    map <C-b> :CtrlPBuffer<cr>

[NERD Tree](https://github.com/preservim/nerdtree) mappings:

    map <leader>nn :NERDTreeToggle<cr>
    map <leader>nb :NERDTreeFromBookmark 
    map <leader>nf :NERDTreeFind<cr>

[goyo.vim](https://github.com/junegunn/goyo.vim) lets you only focus on one thing at a time. It removes all the distractions and centers the content. It only has one mapping. (`<leader>z`)

    map <leader>z :Goyo<cr>

[vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors) mappings to manage multiple cursors at once:

    let g:multi_cursor_start_word_key      = '<C-s>'
    let g:multi_cursor_next_key            = '<C-s>'
    let g:multi_cursor_prev_key            = '<C-p>'
    let g:multi_cursor_skip_key            = '<C-x>'
    let g:multi_cursor_quit_key            = '<Esc>'

[vim-snipmate](https://github.com/garbas/vim-snipmate) the default mapping to autocomplete via snippets is (`<Tab>`)

[ctrl-p](https://github.com/ctrlpvim/ctrlp.vim) mappings to easily find and open a file, buffer, etc.:

    let g:ctrlp_map = '<C-f>'
    map <C-b> :CtrlPBuffer<cr>

[ale](https://github.com/dense-analysis/ale) to easily go to the next Ale syntax/lint error:

    nmap <silent> <leader>a <Plug>(ale_next_wrap)

[vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides) the default mapping to toggle the plugin is (`<leader>ig`)

    You can also use the following commands inside Vim:
    :IndentGuidesEnable
    :IndentGuidesDisable
    :IndentGuidesToggle

[vim-fugitive](https://github.com/tpope/vim-fugitive) to copy the link to the line of a Git repository to the clipboard:

    nnoremap <leader>v :.GBrowse!<CR>
    xnoremap <leader>v :'<'>GBrowse!<CR>

[vim-wiki](https://github.com/vimwiki/vimwiki) to create a personal wiki in vim:

	" <leader>ww -- Open default wiki index file.
	" <leader>wt -- Open default wiki index file in a new tab.
	" <leader>ws -- Select and open wiki index file.
	" <leader>wd -- Delete wiki file you are in. (only in wiki)
	" <leader>wr -- Rename wiki file you are in. (only in wiki)
	" <Enter> -- Follow/Create wiki link. (only in wiki)
	" <Backspace> -- Go back to parent(previous) wiki link. (only in wiki)
	" <Tab> -- Find next wiki link. (only in wiki)
	" <Shift-Tab> -- Find previous wiki link. (only in wiki)


### Cope
Query `:help cope` if you are unsure what cope is. It's super useful!

When you search with `Ack.vim`, display your results in cope by doing:
`<leader>cc`

To go to the next search result do:
`<leader>n`

To go to the previous search results do:
`<leader>p`

Cope mappings:

    map <leader>cc :botright cope<cr>
    map <leader>n :cn<cr>
    map <leader>p :cp<cr>


## Font

    set gfn=IBM_Plex_Mono:h11:W200:cANSI:qDRAFT
    

## How to uninstall
Just do following:
* Remove `~/.vim_runtime`
* Remove any lines that reference `.vim_runtime` in your `~/.vimrc`
