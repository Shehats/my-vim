set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set shiftwidth=2            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
let mapleader = ','
set spell                 " enable spell check (may need to download language package)
set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.
call plug#begin("~/.config/nvim/plugged")
 Plug 'dracula/vim'
 Plug 'ryanoasis/vim-devicons'
 Plug 'SirVer/ultisnips'
 Plug 'honza/vim-snippets'
 Plug 'preservim/nerdtree'
 Plug 'preservim/nerdcommenter'
 Plug 'mhinz/vim-startify'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'lifepillar/vim-solarized8'
 Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
 Plug 'morhetz/gruvbox'
 Plug 'ctrlpvim/ctrlp.vim'
 Plug 'pangloss/vim-javascript'    " JavaScript support
 Plug 'leafgarland/typescript-vim' " TypeScript syntax
 Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
 Plug 'jparise/vim-graphql'        " GraphQL syntax
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'puremourning/vimspector'
 Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
 Plug 'junegunn/fzf.vim'
 Plug 'leafgarland/typescript-vim'
 Plug 'Quramy/tsuquyomi'
 Plug 'tpope/vim-fugitive'
 Plug 'vim-syntastic/syntastic'
 Plug 'vim-ruby/vim-ruby'
 " post install (yarn install | npm install) then load plugin only for editing supported files
 Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
 Plug 'puremourning/vimspector'
 Plug 'tpope/vim-surround'
 Plug 'ryanoasis/vim-devicons'
 Plug 'itchyny/lightline.vim'
 Plug 'terryma/vim-multiple-cursors'
 Plug 'airblade/vim-gitgutter'
 Plug 'dense-analysis/ale'
call plug#end()
set background=dark
colorscheme gruvbox
set splitright
set splitbelow
" move line or visually selected block - alt+j/k 
inoremap <A-j> <Esc>:m .+1<CR>==gi 
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
" move split panes to left/bottom/top/right 
nnoremap <M-h> <C-W>H
nnoremap <M-j> <C-W>J
nnoremap <M-k> <C-W>K 
nnoremap <M-l> <C-W>L 
" move between panes to left/bottom/top/right 
nnoremap <C-h> <C-w>h 
nnoremap <C-j> <C-w>j 
nnoremap <C-k> <C-w>k 
nnoremap <C-l> <C-w>l " Press i to enter insert mode, and ii to exit insert mode. 
:inoremap ii <Esc> 
:inoremap jk <Esc> 
:inoremap kj <Esc> 
:vnoremap jk <Esc> 
:vnoremap kj <Esc>
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
" CoC extensions
let g:coc_global_extensions = ['coc-tsserver']
" Remap keys for applying codeAction to the current line. 
nmap <leader>ac  <Plug>(coc-codeaction) 
" Apply AutoFix to problem on the current line. 
nmap <leader>qf  <Plug>(coc-fix-current)
" GoTo code navigation. 
nmap <silent> gd <Plug>(coc-definition) 
nmap <silent> gy <Plug>(coc-type-definition) 
nmap <silent> gi <Plug>(coc-implementation) 
nmap <silent> gr <Plug>(coc-references)
nmap <M-b> :NERDTreeToggle<CR>
nnoremap <silent> <leader>c} V}:call NERDComment('x', 'toggle')<CR>
nnoremap <silent> <leader>c{ V{:call NERDComment('x', 'toggle')<CR>
" mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval
" Start NERDTree and leave the cursor in it.
" autocmd VimEnter * NERDTree
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Start NERDTree. If a file is specified, move the cursor to its window.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

