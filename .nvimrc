set nocompatible              " be iMproved, required
filetype off                  " required

"
"
" Package Management
"
"
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  " let Vundle manage Vundle, required
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'kien/ctrlp.vim'
  Plugin 'rking/ag.vim'
  Plugin 'airblade/vim-gitgutter'
  Plugin 'scrooloose/syntastic'
  Plugin 'scrooloose/nerdtree'
  Plugin 'sheerun/vim-polyglot'
  Plugin 'bling/vim-airline'
  Plugin 'tpope/vim-rails'
  Plugin 'tpope/vim-bundler'
  Plugin 'thoughtbot/vim-rspec'
  Plugin 'tpope/vim-endwise'
  Plugin 'tpope/vim-surround'
  Plugin 'ervandew/supertab'
  Plugin 'mxw/vim-jsx'
  Plugin 'isRuslan/vim-es6'
  Plugin 'jiangmiao/auto-pairs'
  Plugin 'tpope/vim-eunuch'

  " Colorschemes
  Plugin 'mhartington/oceanic-next'
call vundle#end()            " required
filetype plugin on

" Keymaps
let mapleader="\<Space>"

imap <c-j> <esc>
nmap <C-j> <Insert>
vmap <C-k> <esc>
nmap <c-p> :CtrlP
nmap <C-n> :NERDTreeToggle<CR>

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>a :Ag<Space>
nnoremap <Leader>t :tabe<CR>
nnoremap <Leader>h :nohlsearch<CR>
imap <down> <nop>
imap <up> <nop>
imap <right> <nop>
imap <left> <nop>
nmap <down> <nop>
nmap <up> <nop>
nmap <right> <nop>
nmap <left> <nop>

" Options
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
set splitbelow " open horizontal splits below
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

" Theme
colorscheme OceanicNext
set termguicolors
set background=dark
let g:airline_theme='oceanicnext'

" Nerdtree - show hidden files
let NERDTreeShowHidden=1
let g:airline#extensions#tabline#enabled = 1
set laststatus=2

" Close Completion Preview Window
let g:SuperTabClosePreviewOnPopupClose = 1
let g:SuperTabLongestHighlight = 1

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects
  " .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
