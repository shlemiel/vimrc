"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Extended setup
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable persistent undo
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry

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
