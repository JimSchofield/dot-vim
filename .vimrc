"""""""""
" Swap files...
" I am choosing to store all swap files here so they don't pollute my git
" stuffs
"""""""
set directory^=$HOME/.vim/tmp/

""""""""""
" TABS
"""""""""""
filetype plugin indent on
" show existing with width
set tabstop=4
" when indenting with >
set shiftwidth=4
" on pressing tab
set expandtab
" when in vue, do 2 spacing...
autocmd FileType vue setlocal shiftwidth=2 tabstop=2 expandtab

"""""""""""
" SYNTAX AND APPEARANCE
"""""""""""
syntax on
set wrap!
set scrolloff=20
set sidescrolloff=20
set incsearch

"""""""""""
" NERD TREE
"""""""""""
" autocmd vimenter * NERDTree
let NERDTreeShowHidden=1

"""""""""""
" LINE NUMBERS
"""""""""""
" set number
:set number relativenumber
:set nu rnu

""""""""""
" SYSTEM COPY
""""""""""
vnoremap <C-C> :w !pbcopy<CR><CR>

"""""""""""
" PLUGINS
"""""""""""
call plug#begin('~/.vim/plugged')

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" GIT
Plug 'tpope/vim-fugitive'

" File tree
Plug 'scrooloose/nerdtree'
map <F6> :NERDTreeToggle<cr>

" Code Completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Surround 
Plug 'tpope/vim-surround'

" comment
Plug 'tpope/vim-commentary'

" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run the install script
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
  " Both options are optional. You don't have to install fzf in ~/.fzf
  " and you don't have to run the install script if you use fzf only in Vim.set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:fzf_files_options = '--reverse --preview "(bat {}) 2> /dev/null | head -'.&lines.'"'
nnoremap <leader>fo :GFiles<cr>

" ripgrep
Plug 'jremmen/vim-ripgrep'

" SortMotion
Plug 'christoomey/vim-sort-motion' 


" php indenting
Plug '2072/PHP-Indenting-for-VIm'

" php
Plug 'StanAngeloff/php.vim'

"  " TypeScript syntax
"  Plug 'leafgarland/typescript-vim'
"  " Vue
"  Plug 'posva/vim-vue'
"  " Twig
"  Plug 'nelsyeung/twig.vim'
"  " javascript
"  " AND
"  " jsx
"  Plug 'pangloss/vim-javascript'
"  Plug 'maxmellon/vim-jsx-pretty'

" Polyglot (why I commented languages out above
Plug 'sheerun/vim-polyglot'

" Emmet
Plug 'mattn/emmet-vim'


" search ctrlsf
Plug 'dyng/ctrlsf.vim'

" Ale
Plug 'dense-analysis/ale'
let g:ale_fixers = ['eslint']
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

" Prettier
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/1.x',
  \ 'for': [
    \ 'javascript',
    \ 'typescript',
    \ 'css',
    \ 'less',
    \ 'scss',
    \ 'json',
    \ 'graphql',
    \ 'markdown',
    \ 'vue',
    \ 'lua',
    \ 'php',
    \ 'python',
    \ 'ruby',
    \ 'html',
    \ 'swift' ] }
let g:prettier#config#single_quote = 'true'

" challenger-deep theme
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }


call plug#end()

"""""""""""
" THEME
"""""""""""
" colorscheme new-moon
colorscheme challenger_deep


if has('nvim') || has('termguicolors')
set termguicolors
endif

