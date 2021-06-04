set nocompatible
filetype off

" Plugins will go here
call plug#begin('$HOME/.vim/plugged')

Plug 'easymotion/vim-easymotion'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'jpalardy/vim-slime'
Plug 'davidhalter/jedi-vim'
Plug 'nvie/vim-flake8'
Plug 'ervandew/supertab'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'mitchpaulus/energyplus-vim'
Plug 'python-mode/python-mode'

call plug#end()

" General vim configuration
filetype plugin indent on
syntax on

" Theme
set term=win32
set t_Co=256

colorscheme Tomorrow
set background=light
let g:airline_theme='papercolor'

" Indentation settings
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2
set autoindent
set smartindent

" General preferences
set number
set showcmd
set wildmenu
set showmatch
set incsearch

" Make backspace work like normal
set backspace=indent,eol,start

" Set the splits to below and right
set splitbelow
set splitright

" Start up nerdtree on boot
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p


" Language settings
" Set default spacing for markdown files
autocmd FileType markdown,mkd,md set tabstop=4|set softtabstop=4|set shiftwidth=4

au BufRead *.md setlocal spell
au BufRead *.markdown setlocal spell

" Python
" set pythonthreedll="C:\Users\trooney\AppData\Local\Programs\Python\Python39\python39.dll"
" let g:pydocstring_doq_path = "C:\Users\trooney\AppData\Local\Programs\Python\Python39\Scripts\doq.exe"
let g:pymode_lint_ignore=["E501"]

" Configure vim slime
let g:slime_target="vimterminal"

" Configure tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1


" Remap the leader
let mapleader = ","
let maplocalleader = ","

" Remap fd to escape insert mode
inoremap fd <ESC>
" Remap <leader>t to toggle nerdtree
nnoremap <leader>t :NERDTreeTabsToggle<CR>
