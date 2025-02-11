# vimrc

Inspired by [amix/vimrc](https://github.com/amix/vimrc), but very minimal.

## Install

	git clone https://github.com/shlemiel/vimrc ~/.vim_runtime
	sh ~/.vim_runtime/install_awesome_vimrc.sh

## Update

    cd ~/.vim_runtime
    git reset --hard
    git clean -d --force
    git pull --rebase
    python update_plugins.py  # use python3 if python is unavailable

In case of `ModuleNotFoundError: No module named 'requests'`, please install `requests` python module first. (`pip` or `pip3`)

    pip install requests # use pip3 if pip is unavailable

## Included plugins

* [NERDTree](https://github.com/preservim/nerdtree): A file system explorer for the Vim editor.
* [ctrlp.vim](https://github.com/ctrlpvim/ctrlp.vim): Full path fuzzy file, buffer, mru, tag, ... finder for Vim.
* [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors): Yet another attempt at bringing Sublime Text's multiple selection feature into Vim.
* [pathogen.vim](https://github.com/tpope/vim-pathogen): Manage your 'runtimepath' with ease.


## Included color schemes

* [dracula](https://github.com/dracula/vim): The default
* [awesome-vim-colorschemes](https://github.com/rafi/awesome-vim-colorschemes): Collection of awesome color schemes for Vim, merged for quick use.


## Key mappings

### The `<leader>` key

It is mapped to `<Space>`.


### Key mappings

To turn off highlights of searched text: `<leader>` `<cr>`
	
	nnoremap <silent> <leader><cr> :noh<cr>

To close the current window: `<leader>q`

    nnoremap <leader>q :q<cr>

To toggle the number column on and off: `<leader>s` (useful for terminal copy)

    nnoremap <leader>s :call SidebarToggle()<cr>

To toggle paste mode on and off: `<leader>p` (useful for terminal paste)
	
	nnoremap <leader>p :setlocal paste!<cr>

To save/load unnamed register: `<leader>` `<leader>` (useful for exchanging registers between multiple instances)
	
	nnoremap <silent> <leader><leader> :call InoutRegisters()<cr>

### Plugin related mappings

[NERDTree](https://github.com/preservim/nerdtree) mappings: `<leader>n`, `<leader>C`

    nnoremap <leader>n :NERDTreeFocus<cr>
    nnoremap <leader>C :NERDTreeFind<cr>

To open [ctrlp.vim](https://github.com/kien/ctrlp.vim) plugin to quickly find a file or a buffer: `<ctrl>f`, `<ctrl>b`, `<leader>m`

    " Quickly find and open a file in the CWD
    let g:ctrlp_map = '<C-f>'

    " Quickly find and open a buffer
    nnoremap <C-b> :CtrlPBuffer<cr>

    " Quickly find MRU Files
    nnoremap <leader>m :CtrlPMRUFiles<cr>

[vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors) mappings:

    let g:multi_cursor_start_word_key      = '<C-g>'
    let g:multi_cursor_next_key            = '<C-s>'
    let g:multi_cursor_prev_key            = '<C-p>'
    let g:multi_cursor_skip_key            = '<C-x>'
    let g:multi_cursor_quit_key            = '<Esc>'
    
## How to uninstall
Remove `~/.vim_runtime` and edit `~/.vimrc`.
