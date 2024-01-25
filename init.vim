set nocompatible              " be iMproved, required
filetype off                  " required

" Package Management
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes
  " let Vundle manage Vundle, required
  Plug 'airblade/vim-gitgutter'
  Plug 'scrooloose/syntastic'
  Plug 'scrooloose/nerdtree'
  Plug 'sheerun/vim-polyglot'
  Plug 'bling/vim-airline'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-bundler'
  Plug 'thoughtbot/vim-rspec'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-surround'
  Plug 'ervandew/supertab'
  Plug 'jiangmiao/auto-pairs'
  Plug 'othree/yajs.vim'
  Plug 'tpope/vim-eunuch'
  Plug 'gcmt/wildfire.vim'
  Plug 'janko/vim-test'
  Plug 'kassio/neoterm'
  Plug 'scrooloose/nerdcommenter'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'tpope/vim-projectionist'
  Plug 'tpope/vim-fugitive'

  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'


  " Colorschemes
  Plug 'mhartington/oceanic-next'
call plug#end()
filetype plugin on

" load lua functions for navigation
lua require("navigation")
"
" Keymaps
let mapleader="\<Space>"

imap <c-j> <esc>
nmap <C-j> <Insert>
vmap <C-k> <esc>
nmap <c-p> :FZF<CR>
nmap <C-n> :NERDTreeToggle<CR>
nmap <Leader>n :NERDTreeFind<CR> " Reveal current file in NerdTree
nnoremap <Leader>nr :NERDTreeRefreshRoot<CR> "Refresh root

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>a :Rg<Space>
nnoremap <Leader>t :tabe<CR>
nnoremap <Leader>h :nohlsearch<CR>
nnoremap F :Rg <C-R><C-W><CR>

" vim-test
let test#strategy = "neoterm"
nnoremap <Leader>nn :TestNearest<CR>
nnoremap <Leader>ff :TestFile<CR>
nnoremap <Leader>ss :TestSuite<CR>
nnoremap <Leader>ll :TestLast<CR>

" neoterm settings
let g:neoterm_default_mod = 'vertical'
let g:neoterm_automap_keys = 'tt'
let g:neoterm_fixedsize = 1
let g:neoterm_autoscroll = 1

" close split
tnoremap <C-e> <C-\><C-n>
" toggle terminal split
nnoremap <silent> <leader>m1 :Ttoggle<cr>
" clear terminal
nnoremap <silent> <leader>m2 :Tclear<cr>
" kill job running in terminal
nnoremap <silent> <leader>m3 :Tkill<cr>

" nerdcommenter
let g:NERDCreateDefaultMappings = 0
map <Leader>cc <Plug>NERDCommenterToggle('n', 'Toggle')<Cr>

" projections
nnoremap <silent> <leader>u1 :A<cr>
nnoremap <silent> <leader>u2 :AV<cr>
let g:projectionist_heuristics = {
      \ "package.json": {
      \   'src/*.js': {'alternate': '{}.test.js', 'type': 'source'},
      \   'src/*.test.js': {'alternate': 'src/{}.js', 'type': 'test'}
      \ },
      \ "mix.exs": {
      \   'lib/*.ex': {'alternate': 'test/{}_test.exs', 'type': 'source'},
      \   'test/*_test.exs': {'alternate': 'lib/{}.ex', 'type': 'test'}
      \ }}

" FZF
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1
"Open FZF and choose floating window
let g:fzf_layout = { 'window': 'lua NavigationFloatingWin()' }
"Let the input go up and the search list go down
let $FZF_DEFAULT_OPTS = '--layout=reverse --bind ctrl-d:page-down,ctrl-u:page-up'

imap <c-x><c-f> <plug>(fzf-complete-path)

imap <down> <nop>
imap <up> <nop>
imap <right> <nop>
imap <left> <nop>
nmap <down> <nop>
nmap <up> <nop>
nmap <right> <nop>
nmap <left> <nop>

" Options

set updatetime=100 "set updatetime to shorter value

" Text
set tabstop=2 " spaces per tab
set softtabstop=2 " spaces in tab when editing
set expandtab " tabs as spaces
set smarttab " insert tabs on start of a line
set textwidth=80 " width to 80 chars
set shiftwidth=2
set autoindent
set copyindent " copy indentation
set smartindent " fix indent on new lines
" set splitbelow " open horizontal splits below
set splitright " open vertical splits on the right

" UI
set ruler " show ruler
set number " line numbers
set showcmd " hight current line
filetype indent on " load filetype specific indent files
set lazyredraw " redraw only when necessary
set showmatch " show matching parenthesis [ { ( ) } ]

" Searching
set incsearch " incremental search
set ignorecase " case insensitive
set hlsearch " highlight search results

" Backups
set nobackup       " do not backup
set nowritebackup  " do not write backups
set noswapfile     " do not create .swp files
set history=50
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set encoding=utf-8
set completeopt=longest

" Others
syntax enable
syntax on
set clipboard=unnamed

" Mouse
set mouse=a

" Theme
colorscheme OceanicNext
if (has("termguicolors"))
  set termguicolors
endif
"set background=dark
let g:airline_theme='oceanicnext'

" Nerdtree - show hidden files
let NERDTreeShowHidden=1
let NERDTreeIgnore = ['\.DS_Store$']

" Multi cursors
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<C-i><C-n>'
let g:multi_cursor_next_key            = '<C-i><C-n>'
let g:multi_cursor_select_all_word_key = '<C-i><C-l>'
let g:multi_cursor_quit_key            = '<Esc>'

" Fugitive
" show current file's history in tig, on a new tmux window
nmap <silent> <leader>gh :silent execute "!tmux new-window tig " . expand("%:p")<CR>

" show commits for every source line
nnoremap <Leader>gb :Gblame<CR>

let g:airline#extensions#tabline#enabled = 1
set laststatus=2

" Close Completion Preview Window
let g:SuperTabClosePreviewOnPopupClose = 1
let g:SuperTabLongestHighlight = 1

" Disable JS - Vim Polyglot Plugin
"let g:polyglot_disabled = ['javascript']

" resize splits when vim is resized
autocmd VimResized * wincmd =
