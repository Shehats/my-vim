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
" Specify a directory for plugins
call plug#begin("~/.config/nvim/plugged")
  "Plug 'tsony-tsonev/nerdtree-git-plugin' Plug 'Xuyuanp/nerdtree-git-plugin'
  " Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'ryanoasis/vim-devicons'
  Plug 'airblade/vim-gitgutter'
  " Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'morhetz/gruvbox'
" Initialize plugin system
  Plug 'dracula/vim'
  Plug 'ryanoasis/vim-devicons'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  " Plug 'preservim/nerdtree'
  Plug 'preservim/nerdcommenter'
  Plug 'mhinz/vim-startify'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'pangloss/vim-javascript'    " JavaScript support
  Plug 'leafgarland/typescript-vim' " TypeScript syntax
  Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
  Plug 'jparise/vim-graphql'        " GraphQL syntax
  Plug 'puremourning/vimspector'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'vim-syntastic/syntastic'
  Plug 'vim-ruby/vim-ruby'
  " post install (yarn install | npm install) then load plugin only for editing supported files
  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
  Plug 'tpope/vim-surround'
  Plug 'ryanoasis/vim-devicons'
  Plug 'itchyny/lightline.vim'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'nsf/gocode'
  Plug 'sonph/onehalf', { 'rtp': 'vim' }
  Plug 'dense-analysis/ale'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'junegunn/vim-easy-align'
  Plug 'mbbill/undotree'
  Plug 'nanotech/jellybeans.vim'
  Plug 'dense-analysis/ale'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" coc setting
" Coc stuff
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" " Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-json',
  \ 'coc-solargraph'
  \ ]

" " Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" ale settings
" disable ale lsp
let g:ale_disable_lsp = 1
nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>
nnoremap K :ALEHover<CR>
let js_fixers = ['prettier', 'eslint']
let ts_fixers = ['prettier', 'tslint']

let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'javascript': js_fixers,
  \ 'javascript.jsx': js_fixers,
  \ 'typescript': ts_fixers,
  \ 'typescriptreact': js_fixers,
  \ 'css': ['prettier'],
  \ 'json': ['prettier'],
  \ }
let g:ale_fix_on_save = 1
let g:ale_sign_error = "🐛"
let g:ale_sign_warning = "⚠️"
let g:ale_sign_info = "ℹ"
let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_prefix = "🔥 "

" Buffers {{{2
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
" delete buffer
nnoremap <leader>bd :bd<CR>
nnoremap <leader>bk :bd!<CR>
" Terminal {{{2
tnoremap <C-o> <C-\><C-n>
" find visually selected text
vnoremap * y/<C-R>"<CR>
" replace word under cursor
nnoremap <Leader>tr :%s/\<<C-R><C-W>\>//gc<Left><Left><Left>

" System clipboard
" nnoremap <Leader>p "+p
" nnoremap <Leader>P "+P
" vnoremap <Leader>y "+y
" nnoremap <Leader>yy "+yy
" remove trailing spaces
" make a separate plugin for the commands
command! RemoveTrailingSpaces :silent! %s/\v(\s+$)|(\r+$)//g<bar>
		\:exe 'normal ``'<bar>
		\:echo 'Remove trailing spaces and ^Ms.'

command! JustOneInnerSpace :let pos=getpos('.')<bar>
		\:silent! s/\S\+\zs\s\+/ /g<bar>
		\:silent! s/\s$//<bar>
		\:call setpos('.', pos)<bar>
		\:nohl<bar>
		\:echo 'Just one space'

command! CapitalizeWord :let pos=getpos('.')<bar>
		\:exe 'normal guiw~'<bar>
		\:call setpos('.', pos)

command! UppercaseWord :let pos=getpos('.')<bar>
		\:exe 'normal gUiw'<bar>
		\:call setpos('.', pos)

command! LowercaseWord :let pos=getpos('.')<bar>
		\:exe 'normal guiw'<bar>
		\:call setpos('.', pos)
" Set up FZF {{{3
function! SearchWordWithAg()
  execute 'Ag' expand('<cword>')
endfunction
function! SearchVisualSelectionWithAg() range
  let old_reg = getreg('"')
  let old_regtype = getregtype('"')
  let old_clipboard = &clipboard
  set clipboard&
  normal! ""gvy
  let selection = getreg('"')
  call setreg('"', old_reg, old_regtype)
  let &clipboard = old_clipboard
  execute 'Ag' selection
endfunction
function! SearchWithAgInDirectory(...)
  call fzf#vim#ag(join(a:000[1:], ' '), extend({'dir': a:1}, g:fzf#vim#default_layout))
endfunction
command! -nargs=+ -complete=dir AgIn call SearchWithAgInDirectory(<f-args>)
nnoremap <silent> <leader><space> :Files<CR>
nnoremap <silent> <leader>a :Buffers<CR>
nnoremap <silent> <leader>A :Windows<CR>
nnoremap <silent> <leader>; :BLines<CR>
nnoremap <silent> <leader>o :BTags<CR>
nnoremap <silent> <leader>O :Tags<CR>
nnoremap <silent> <leader>? :History<CR>
nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR>
nnoremap <silent> <leader>. :AgIn
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
nnoremap <C-p> :<C-u>FZF<CR>

fun! s:fzf_root()
	let path = finddir(".git", expand("%:p:h").";")
	return fnamemodify(substitute(path, ".git", "", ""), ":p:h")
endfun

nnoremap <silent> <Leader>ff :exe 'Files ' . <SID>fzf_root()<CR>

nnoremap <silent> <Leader>fc :Colors<CR>
nnoremap <silent> <Leader>fh :History<CR>
nnoremap <silent> <Leader>bb :Buffers<CR>
nnoremap <silent> <Leader>; :Commands<CR>
nnoremap <silent> <Leader>h :Helptags<CR>
nnoremap <silent> <Leader>ll :Lines<CR>
nnoremap <silent> <Leader>lb :BLines<CR>

let g:lightline = {
  \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'fugitive', 'gitgutter', 'filename' ] ],
    \   'right': [ [ 'percent', 'lineinfo' ],
    \              [ 'syntastic' ],
    \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
    \ },
    \ 'component_function': {
      \   'fugitive': 'LightLineFugitive',
      \   'gitgutter': 'LightLineGitGutter',
      \   'readonly': 'LightLineReadonly',
      \   'modified': 'LightLineModified',
      \   'syntastic': 'SyntasticStatuslineFlag',
      \   'filename': 'LightLineFilename'
      \ },
    \ 'separator': { 'left': '▓▒░', 'right': '░▒▓' },
    \ 'subseparator': { 'left': '>', 'right': '' }
  \ }

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightLineReadonly()
  if &filetype == "help"
    return ""
  elseif &readonly
    return "RO"
  else
    return ""
  endif
endfunction

function! LightLineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

function! LightLineGitGutter()
  if ! exists('*GitGutterGetHunkSummary')
    \ || ! get(g:, 'gitgutter_enabled', 0)
    \ || winwidth('.') <= 90
    return ''
  endif
    let symbols = [
      \ g:gitgutter_sign_added,
      \ g:gitgutter_sign_modified,
      \ g:gitgutter_sign_removed
      \ ]
    let hunks = GitGutterGetHunkSummary()
    let ret = []
    for i in [0, 1, 2]
      if hunks[i] > 0
        call add(ret, symbols[i] . hunks[i])
      endif
    endfor
  return join(ret, ' ')
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
    \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
    \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction
" {{{ Modified jellybeans theme
let s:base03    = [ '#151513', 233 ]
let s:base02    = [ '#30302c', 236 ]
let s:base01    = [ '#4e4e43', 237 ]
let s:base00    = [ '#666656', 242 ]
let s:base0     = [ '#808070', 244 ]
let s:base1     = [ '#949484', 246 ]
let s:base2     = [ '#a8a897', 248 ]
let s:base3     = [ '#e8e8d3', 253 ]
let s:yellow    = [ '#ffb964', 215 ]
let s:red       = [ '#cf6a4c', 167 ]
let s:magenta   = [ '#f0a0c0', 217 ]
let s:blue      = [ '#7697D6', 4   ]
let s:orange    = [ '#ffb964', 215 ]
let s:green     = [ '#99ad6a', 107 ]
let s:white     = [ '#FCFCFC', 15  ]
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}, 'terminal': {}}
let s:p.normal.left     = [ [ s:white, s:blue ], [ s:base3, s:base02 ] ]
let s:p.normal.right    = [ [ s:base02, s:base1 ], [ s:base3, s:base02 ] ]
let s:p.inactive.right  = [ [ s:base02, s:base00 ], [ s:base0, s:base02 ] ]
let s:p.inactive.left   = [ [ s:base0, s:base02 ], [ s:base00, s:base02 ] ]
let s:p.insert.left     = [ [ s:base02, s:orange ], [ s:base3, s:base01 ] ]
let s:p.replace.left    = [ [ s:base02, s:red ], [ s:base3, s:base01 ] ]
let s:p.visual.left     = [ [ s:base02, s:magenta ], [ s:base3, s:base01 ] ]
let s:p.terminal.left   = [ [ s:base02, s:green ], [ s:base3, s:base01 ] ]
let s:p.normal.middle   = [ [ s:base0, s:base03 ] ]
let s:p.inactive.middle = [ [ s:base00, s:base02 ] ]
let s:p.tabline.left    = [ [ s:base3, s:base02 ] ]
let s:p.tabline.tabsel  = [ [ s:white, s:blue ] ]
let s:p.tabline.middle  = [ [ s:base01, s:base03 ] ]
let s:p.tabline.right   = [ [ s:base03, s:base03 ], [ s:base03, s:base03 ] ]
let s:p.normal.error    = [ [ s:red, s:base02 ] ]
let s:p.normal.warning  = [ [ s:yellow, s:base01 ] ]
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>ge :Gedit<CR>
nnoremap <silent> <leader>gE :Gedit<space>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gR :Gread<space>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>gW :Gwrite!<CR>
nnoremap <silent> <leader>gq :Gwq<CR>
nnoremap <silent> <leader>gQ :Gwq!<CR>

function! ReviewLastCommit()
  if exists('b:git_dir')
    Gtabedit HEAD^{}
    nnoremap <buffer> <silent> q :<C-U>bdelete<CR>
  else
    echo 'No git a git repository:' expand('%:p')
  endif
endfunction

nnoremap <silent> <leader>g` :call ReviewLastCommit()<CR>

augroup fugitiveSettings
  autocmd!
  autocmd FileType gitcommit setlocal nolist
  autocmd BufReadPost fugitive://* setlocal bufhidden=delete
augroup END

function! TerminalSplitStrategy(cmd) abort
  tabnew | call termopen(a:cmd) | startinsert
endfunction
let g:test#custom_strategies = get(g:, 'test#custom_strategies', {})
let g:test#custom_strategies.terminal_split = function('TerminalSplitStrategy')
let test#strategy = 'terminal_split'
nnoremap <silent> <leader>rr :TestFile<CR>
nnoremap <silent> <leader>rf :TestNearest<CR>
nnoremap <silent> <leader>rs :TestSuite<CR>
nnoremap <silent> <leader>ra :TestLast<CR>
nnoremap <silent> <leader>ro :TestVisit<CR>
set undofile
" Auto create undodir if not exists
let undodir = expand($HOME . '/.config/nvim/cache/undodir')
if !isdirectory(undodir)
  call mkdir(undodir, 'p')
endif
let &undodir = undodir
nnoremap <leader>U :UndotreeToggle<CR>

" ctrlp
" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
set smarttab
set cindent
set tabstop=2
set shiftwidth=2
" always uses spaces instead of tab characters
set expandtab
syntax on
set t_Co=256
set cursorline
colorscheme jellybeans
let g:airline_theme='onehalfdark'
let g:jellybeans_use_term_background_color = 0
" lightline
" let g:lightline = { 'colorscheme': 'onehalfdark' }
" set background=dark
" colorscheme gruvbox
" let g:gruvbox_italic=1
" let g:gruvbox_contrast_dark='soft'
set splitright
set splitbelow
inoremap jk <ESC>
vmap // <plug>NERDCommenterToggle
nmap // <plug>NERDCommenterToggle
vmap <leader>// <plug>NERDCommenterSexy
nmap <leader>// <plug>NERDCommenterSexy
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
" CoC extensions
" map <M-b> :NERDTreeToggle<CR>
nnoremap <silent> <leader>c} V}:call NERDComment('x', 'toggle')<CR>
nnoremap <silent> <leader>c{ V{:call NERDComment('x', 'toggle')<CR>

" let g:NERDTreeGitStatusWithFlags = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
" let g:NERDTreeGitStatusNodeColorization = 1
" let g:NERDTreeColorMapCustom = {
    " \ "Staged"    : "#0ee375",
    " \ "Modified"  : "#d9bf91",
    " \ "Renamed"   : "#51C9FC",
    " \ "Untracked" : "#FCE77C",
    " \ "Unmerged"  : "#FC51E6",
    " \ "Dirty"     : "#FFBD61",
    " \ "Clean"     : "#87939A",
    " \ "Ignored"   : "#808080"
    " \ }

" let g:NERDTreeIgnore = ['^node_modules$']

" mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)
" Create default mappings
" let g:NERDCreateDefaultMappings = 1

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

" vim multiple cursor mappings
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<A-d>'
let g:multi_cursor_select_all_word_key = '<A-D>'
let g:multi_cursor_start_key           = 'g<A-d>'
let g:multi_cursor_select_all_key      = 'g<A-D>'
let g:multi_cursor_next_key            = '<A-N>'
let g:multi_cursor_prev_key            = '<A-P>'
let g:multi_cursor_skip_key            = '<A-X>'
let g:multi_cursor_quit_key            = '<Esc>'

" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval
let g:vimspector_enable_mappings = 'HUMAN'
" Start NERDTree and leave the cursor in it.
" autocmd VimEnter * NERDTree
" Start NERDTree when Vim is started without file arguments.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Start NERDTree. If a file is specified, move the cursor to its window.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" Start NERDTree when Vim starts with a directory argument.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    " \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
" autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    " \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
" functions
" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
" from readme
" if hidden is not set, TextEdit might fail.
" set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
nnoremap <M-(> :execute "normal \<Plug>Ysurroundiw)"<cr>
nnoremap <M-"> :execute 'normal \<Plug>Ysurroundiw"'<cr>
nnoremap <M-'> :execute "normal \<Plug>Ysurroundiw'"<cr>
nnoremap <M-{> :execute "normal \<Plug>Ysurroundiw}"<cr>
nnoremap <M-[> :execute "normal \<Plug>Ysurroundiw]"<cr>
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
