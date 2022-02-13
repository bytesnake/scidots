call plug#begin()

" install plugins for markdown highlighting
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" syntax highlighting
Plug 'morhetz/gruvbox'

" highlight marks
Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-mark'

" zotero citations are awesome
Plug 'jalvesaq/zotcite'

" linked notes
Plug 'mattn/libcallex-vim', { 'do': 'make -C autoload' }
Plug '/home/lorenz/Documents/projects/vim-linked', { 'do': 'cargo install --release' }
Plug '/home/lorenz/Documents/projects/vim-math', { 'do': 'cargo install --release' }

call plug#end()

" set spell checking to english+german
set spelllang=en_us,de

runtime look.vim
runtime custom_bindings.vim
runtime marks.vim
