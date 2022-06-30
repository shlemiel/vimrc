#!/bin/sh
set -e

cd ~/.vim_runtime

echo '" DO NOT EDIT THIS FILE
" Add your own customizations in ~/.vim_runtime/my_configs.vim

set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim
try
  source ~/.vim_runtime/my_configs.vim
catch
endtry' > ~/.vimrc
 
echo "set sw=4 sts=4 ts=4
set expandtab

set autoindent
set smartindent

color dracula

set showcmd

set cursorcolumn

runtime macros/matchit.vim

let g:vimwiki_list = [{'path': '~/Documents/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]" > ~/.vim_runtime/my_configs.vim

echo "Installed the Ultimate Vim configuration successfully! Enjoy :-)"
