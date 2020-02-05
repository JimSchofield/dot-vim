"""""""""
" Swap files...
" I am choosing to store all swap files here so they don't pollute my git
" stuffs
"""""""
set directory^=$HOME/.vim/tmp/

"""""""
" Set vimr files per project
"""""""
set exrc

""""""""""
" SYSTEM
""""""""""
nnoremap <leader>vim :tabe ~/.vimrc<CR>
nnoremap <leader>s :source ~/.vimrc<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>r :Rg<CR>
set ignorecase
set smartcase

""""""""""
" Search for selected
""""""""""
vnoremap <leader>/ y/<C-R>=escape(@",'/\')<CR><CR>

""""""""""
" TABS
"""""""""""
filetype plugin indent on
" show existing with width
set tabstop=2
" when indenting with >
set shiftwidth=2
" on pressing tab
set expandtab
" when in vue, do 2 spacing...
" autocmd FileType vue setlocal shiftwidth=2 tabstop=2 expandtab
" autocmd fileType javascript setlocal shiftwidth=2 tabstop=2 expandtab

" command to switch between...
command! -nargs=1 ChangeTabs :set shiftwidth=<args> tabstop=<args> expandtab  

""""""""""""
" Moving lines with Alt-j/k
" This is specifically MAC
""""""""""""
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

""""""""""""
" google SEARCH
""""""""""""
vmap <leader>G "ay :!google <C-r>a<CR>

""""""""""""
" buffers
""""""""""""
command! BufOnly silent! execute "%bd|e#|bd#"

"""""""""""
" syntax AND APPEARANCE
"""""""""""
syntax on
set wrap!
set scrolloff=20
set sidescrolloff=20
set incsearch

"""""""""""
" nerd trEE
"""""""""""
" autocmd vimenter * NERDTree
let nerdtreeShowHidden=1

"""""""""""
" line nuMBERS
"""""""""""
" set number
:set number relativenumber
:set nu rnu

""""""""""
" system COPY
""""""""""
vnoremap <C-C> :w !pbcopy<CR><CR>

"""""""""""
" plugins
"""""""""""
call plug#begin('~/.vim/bundle')

" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Just show the filename (no path) in the tab
let g:airline#extensions#tabline#fnamemod = ':t'

" Auto-pairs
Plug 'jiangmiao/auto-pairs'
nnoremap <leader>ap :call AutoPairsToggle()<CR>
inoremap <leader>ap <esc>:call AutoPairsToggle()<CR>i


" targets 
" Plug 'wellle/targets.vim'

" git
Plug 'tpope/vim-fugitive'

" file tree
Plug 'scrooloose/nerdtree'
map <f6> :NERDTreeToggle<cr>

" RipGrep

" begin cOC
" code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

let g:coc_global_extensions = [
            \ 'coc-snippets',
            \ 'coc-tsserver',
            \ 'coc-eslint',
            \ 'coc-json',
            \ ]

" use tab for trigger completion with characters ahead and navigate.
" use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" use k to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" end coc

" surround
Plug 'tpope/vim-surround'

" comment
Plug 'tpope/vim-commentary'

" pluginstall and PlugUpdate will clone fzf in ~/.fzf and run the install script
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" both options are optional. You don't have to install fzf in ~/.fzf
" and you don't have to run the install script if you use fzf only in Vim.set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:fzf_files_options = '--reverse --preview "(bat {}) 2> /dev/null | head -'.&lines.'"'
nnoremap <leader>f :Files<cr>

" sortmotion
Plug 'christoomey/vim-sort-motion'


" php indenting
Plug '2072/PHP-Indenting-for-VIm'

" php
Plug 'stanAngeloff/php.vim'

"  " typeScript syntax
"  plug 'leafgarland/typescript-vim'
"  " vue
"  plug 'posva/vim-vue'
"  " twig
"  plug 'nelsyeung/twig.vim'
"  " javascript
"  " and
"  " jsx
"  plug 'pangloss/vim-javascript'
"  plug 'maxmellon/vim-jsx-pretty'

" polyglot (why I commented languages out above
Plug 'sheerun/vim-polyglot'

" emmet
Plug 'mattn/emmet-vim'


" search ctrlsf
vnoremap ∆ :m '+1<CR>gv=gv
Plug 'dyng/ctrlsf.vim'

" ale
Plug 'dense-analysis/ale'
let g:ale_fixers = ['eslint']
" set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

" prettier
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


" doc gen
Plug 'kkoomen/vim-doge'

call plug#end()

"""""""""""
" theme
"""""""""""
" colorscheme new-moon
colorscheme challenger_deep
" set background to be transparent
hi normal guibg=NONE ctermbg=NONE

"  if has('nvim') || has('termguicolors')
"  set termguicolors
"  endif
