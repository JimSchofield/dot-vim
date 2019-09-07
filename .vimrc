"""""""""""
" TABS
"""""""""""
filetype plugin indent on
" show existing with width
set tabstop=4
" when indenting with >
set shiftwidth=4
" on pressing tab
set expandtab


"""""""""""
" SYNTAX AND APPEARANCE
"""""""""""
syntax on
set wrap!
set scrolloff=4
set sidescrolloff=15

"""""""""""
" LINE NUMBERS
"""""""""""
set number


"""""""""""
" PLUGINS
"""""""""""
call plug#begin('~/.vim/plugged')

" File tree
Plug 'scrooloose/nerdtree'
map <F6> :NERDTreeToggle<cr>

" Code Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" fuzzy finder
Plug '/usr/local/opt/fzf'
set runtimepath^=~/.vim/bundle/ctrlp.vim

" TypeScript syntax
Plug 'leafgarland/typescript-vim'

" php indenting
Plug '2072/PHP-Indenting-for-VIm'

" php
Plug 'StanAngeloff/php.vim'

" Emmet
Plug 'mattn/emmet-vim'

" Vue
Plug 'posva/vim-vue'

" search ctrlsf
Plug 'dyng/ctrlsf.vim'

" challenger-deep theme
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
if has('nvim') || has('termguicolors')
  set termguicolors
endif

call plug#end()

"""""""""""
" THEME
"""""""""""
" colorscheme new-moon
colorscheme challenger_deep
