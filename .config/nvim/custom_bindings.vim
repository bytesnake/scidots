" contains custom bindings for Neo Vim
"

" move between panes to left/bottom/top/right
 nnoremap <C-h> <C-w>h
 nnoremap <C-j> <C-w>j
 nnoremap <C-k> <C-w>k
 nnoremap <C-l> <C-w>l

" press double i to exit insert model
 :inoremap ii <Esc>

" open a path with `xdg-open`
 nmap gx :cd %:h<CR>:silent execute "!xdg-open " . shellescape("<cWORD>") . " &"<CR>:redraw!<CR>

" map leader key to space
map <Space> <Leader>

" map popmenu completion to more intuitive bindings
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<Up>"

