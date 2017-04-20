" Automatic installation of Vundle if it is not available
let vundleAvailable=1
let vundle_readme=expand('$HOME/vimfiles/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p $HOME/vimfiles/bundle
    silent !git clone https://github.com/VundleVim/Vundle.vim vimfiles/bundle/vundle
    let vundleAvailable=0
endif


" Setup of Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/vimfiles/bundle/vundle
call vundle#begin('$HOME/vimfiles/bundle/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/gv.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'easymotion/vim-easymotion'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-bufferline'
Plugin 'majutsushi/tagbar'
Plugin 'craigemery/vim-autotag'
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'reedes/vim-pencil'

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
if has('gui_running')
  colorscheme deep-space
  set guifont=DejaVu\ Sans\ Mono\ 11
else
  colorscheme deep-space256
endif

" Windows-specific configuratations
" Set font
set guifont=DejaVuSansMonoForPowerline_NF:h11:cANSI:qDRAFT
" Maximize on startup
au GUIEnter * simalt ~x

"
" General configuration
syntax on

set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2
set autoindent
set smartindent

set number
set showcmd     " Show last command
set wildmenu    " Show menu suggestions
set lazyredraw  " Only redraw when needed
set showmatch   " Show matching brackets

set incsearch   " Search as typing

" Make backspace work like normal editors
set backspace=indent,eol,start

" Set splits to below and right
set splitbelow
set splitright

" Start up nerdtree on boot
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p


" Use pencil for markdown  and text files
" let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END


" Disable python-mode rope to avoid interfering with jedi-vim
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope = 0


" Remappings "

" Remap the leader
let mapleader = ","
" Remap control-c to close current buffer without closing the window
nnoremap <C-c> :bp\|bd#<CR>
" Remap F8 to opening the tagbar
nmap <F8> :TagbarToggle<CR>
" Remap <leader>. to search tags
nnoremap <leader>. :CtrlPTag<CR>
" Remap <leader>t to toggle nerdtree
nnoremap <leader>t :NERDTreeTabsToggle<CR>
" Create a command to generate tag files in the current directory
command GenerateTags execute ':silent !ctags -R -f tags .' | execute ':redraw!'
" Set easymotion to use space
map <Space> <Plug>(easymotion-prefix)
" Create a command to remove whitespace from a document
command RemoveWhitespace execute ':%s/\s\+$//e'
" Remap split movements to ctrl keys
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
