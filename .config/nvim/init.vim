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
Plug 'bytesnake/vim-linked', { 'do': 'cargo install --release' }
Plug 'bytesnake/vim-graphical-preview', { 'do': 'cargo install --release' }

" Collection of common configurations for the Nvim LSP client
Plug 'neovim/nvim-lspconfig'

" Adds extra functionality over rust analyzer
Plug 'simrat39/rust-tools.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'nvim-lua/plenary.nvim'

call plug#end()

" set spell checking to english+german
set spelllang=en_us,de

function! GetSyntaxID()
    return synID(line('.'), col('.'), 1)
endfunction

function! GetSyntaxParentID()
    return synIDtrans(GetSyntaxID())
endfunction

function! GetSyntax()
    echo synIDattr(GetSyntaxID(), 'name')
    exec "hi ".synIDattr(GetSyntaxParentID(), 'name')
endfunction

runtime look.vim
runtime custom_bindings.vim
runtime marks.vim
runtime rust-analyzer.vim

