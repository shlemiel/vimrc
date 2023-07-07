"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Extended setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable persistent undo
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry

" Change register size
set viminfo='20,<1000,s100,h

" Toggle sidebar
set nu
set rnu

function! SidebarToggle()
    if(&nu == 1)
        set nonu
        set nornu
        set scl=no
    else
        set nu
        set rnu
        set scl=auto
    end
endfunction

nnoremap <leader>s :call SidebarToggle()<CR>
