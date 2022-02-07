call plug#begin()

" install plugins for markdown highlighting
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" syntax highlighting
Plug 'morhetz/gruvbox'

" zotero citations are awesome
Plug 'jalvesaq/zotcite'

" vim image
Plug 'AdamTillou/vim-imager'

" linked notes
Plug 'mattn/libcallex-vim', { 'do': 'make -C autoload' }
Plug '/home/lorenz/Documents/projects/vim-linked', { 'do': 'cargo install --release' }
Plug '/home/lorenz/Documents/projects/vim-math', { 'do': 'cargo install --release' }

call plug#end()

runtime look.vim
runtime custom_bindings.vim
