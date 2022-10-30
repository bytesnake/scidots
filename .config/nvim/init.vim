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
Plug 'bytesnake/vim-linked', { 'do': 'cargo build --release' }
Plug 'bytesnake/vim-graphical-preview', { 'do': 'cargo build --release' }
"Plug '/home/losch/Documents/vim-graphical-preview', { 'do': 'cargo build --release' }

" Collection of common configurations for the Nvim LSP client
"Plug 'neovim/nvim-lspconfig'

" Completion framework
"Plug 'hrsh7th/nvim-cmp'

" LSP completion source for nvim-cmp
"Plug 'hrsh7th/cmp-nvim-lsp'

" Snippet completion source for nvim-cmp
"Plug 'hrsh7th/cmp-vsnip'

" Adds extra functionality over rust analyzer
"Plug 'simrat39/rust-tools.nvim'

call plug#end()

" set spell checking to english+german
set spelllang=en_us,de
" add special rule for mutt mails
au BufRead /tmp/mutt-* set tw=72

" use cfilter for quickfix narrowing
packadd cfilter
cnoreabbrev cf Cfilter

" add stashing feature
command -nargs=? -complete=file Stash :!stash <args>

runtime look.vim
runtime custom_bindings.vim
runtime marks.vim
"runtime rust-analyzer.vim
