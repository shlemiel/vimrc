"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Pathogen
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vim_runtime = expand('<sfile>:p:h')."/.."
call pathogen#infect(s:vim_runtime.'/common_plugins/sources_forked/{}')
call pathogen#infect(s:vim_runtime.'/common_plugins/sources_non_forked/{}')
if has('nvim')
    call pathogen#infect(s:vim_runtime.'/nvim_plugins/sources_forked/{}')
    call pathogen#infect(s:vim_runtime.'/nvim_plugins/sources_non_forked/{}')
else
    call pathogen#infect(s:vim_runtime.'/vim_plugins/sources_forked/{}')
    call pathogen#infect(s:vim_runtime.'/vim_plugins/sources_non_forked/{}')
endif
call pathogen#infect(s:vim_runtime.'/my_plugins/{}')
call pathogen#helptags()


if has('nvim')
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => LuaSnip
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
    inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

    snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
    snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

    " For changing choices in choiceNodes
    imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
    smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

    lua require("luasnip.loaders.from_lua").load()
    lua require("luasnip.loaders.from_vscode").lazy_load()

    nnoremap <leader>f :Telescope find_files<cr>
else
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " => vim-vsnip
    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    imap <expr> <Tab>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<Tab>'
    smap <expr> <Tab>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<Tab>'

    imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
    smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

    " Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
    nmap        s   <Plug>(vsnip-select-text)
    xmap        s   <Plug>(vsnip-select-text)
    nmap        S   <Plug>(vsnip-cut-text)
    xmap        S   <Plug>(vsnip-cut-text)

    nnoremap <leader>f :CtrlP<cr>
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CtrlP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 0
let g:ctrlp_map = '<C-f>'
nnoremap <C-b> :CtrlPBuffer<cr>

let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NerdTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden = 0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize = 35
nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <leader>b :NERDTreeFromBookmark<Space>
nnoremap <leader>C :NERDTreeFind<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-multiple-cursors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_use_default_mapping = 0

let g:multi_cursor_start_word_key      = '<C-s>'
let g:multi_cursor_next_key            = '<C-s>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*FugitiveHead")?FugitiveHead():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*FugitiveHead") && ""!=FugitiveHead())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ale (syntax checker and linter)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['flake8'],
\   'go': ['go', 'golint', 'errcheck']
\}

nnoremap <silent> <leader>a <Plug>(ale_next_wrap)

let g:ale_set_highlights = 0

let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_insert_leave = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Gitgutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled = 0
nnoremap <silent> <leader>d :GitGutterToggle<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => EditorConfig (project-specific EditorConfig rule)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EditorConfig_exclude_patterns = ['fugitive://.*']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fugitive
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copy the link to the line of a Git repository to the clipboard
nnoremap <leader>v :.GBrowse!<CR>
xnoremap <leader>v :'<'>GBrowse!<CR>




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vimwiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_key_mappings = { 'lists': 0, 'table_format': 0, 'table_mappings': 0 }
let g:vimwiki_autowriteall = 0
let g:vimwiki_table_auto_fmt = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ack
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use the the_silver_searcher if possible (much faster than Ack)
if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'
endif

" Open Ack and put the cursor in the right position
nnoremap <leader>g :Ack 


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Cope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open the cope window
nnoremap <leader>cc :botright cope<cr>

" Make sure that enter is never overriden in the quickfix window
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
