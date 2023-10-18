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
        if exists('&scl')
            set scl=no
        end
    else
        set nu
        set rnu
        if exists('&scl')
            set scl=auto
        end
    end
endfunction

nnoremap <leader>s :call SidebarToggle()<CR>

nnoremap <leader><leader> :call InoutRegisters()<CR>

function! InoutRegisters()
    :call setreg('+', readfile(expand('~/.vim_runtime/temp_dirs/__tmp_regplus_contents'))[0])
    :call writefile([getreg('"')], expand('~/.vim_runtime/temp_dirs/__tmp_regplus_contents'))
endfunction
