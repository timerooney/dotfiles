" Automatic installation of Vundle if it is not available
let vundleAvailable=1
let vundle_readme=expand('$HOME/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p $HOME/.vim/bundle
    silent !git clone https://github.com/VundleVim/Vundle.vim $HOME/.vim/bundle/vundle
    let vundleAvailable=0
endif


set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-bufferline'
Plugin 'majutsushi/tagbar'

if vundleAvailable  == 0
    echo "Installing Vundles, please ignore key map error messages"
    echo ""
    :PluginInstall
endif

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" 256 colors
set t_Co=256
" Colorscheme
colorscheme wombat256mod
let g:airline_theme='wombat'
syntax on

set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set smartindent

set number
set showcmd     " Show last command
set wildmenu    " Show menu suggestions
set lazyredraw  " Only redraw when needed
set showmatch   " Show matching brackets

set incsearch   " Search as typing

" Start up nerdtree on boot
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p


" Remappings "

" Remap control-c to close current buffer without closing the window
nnoremap <C-c> :bp\|bd#<CR>
" Remap F8 to opening the tagbar
nmap <F8> :TagbarToggle<CR>
