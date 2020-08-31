set shell=/bin/bash           " ensure that bash shell is being used
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim/
call vundle#begin('$HOME/.vim/bundle/')
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

Plugin 'tpope/vim-fugitive'

Plugin 'reedes/vim-pencil'
Plugin 'junegunn/goyo.vim'
Plugin 'reedes/vim-wordy'
Plugin 'reedes/vim-lexical'
Plugin 'ervandew/supertab'

Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'easymotion/vim-easymotion'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'

Plugin 'majutsushi/tagbar'

Plugin 'jpalardy/vim-slime'

Plugin 'chrisbra/csv.vim'

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

""" General vim configuration
syntax on

"set termguicolors
if $TERM -- "xterm-256color"
  set t_Co=256
endif

colorscheme gruvbox
set background=dark
let g:airline_theme='wombat'
set guifont=DejaVu_Sans_Mono:h12:cANSI:qDRAFT

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
set lazyredraw
set showmatch
set incsearch

" Make backspace work like normal
set backspace=indent,eol,start

" Set splits to below and right
set splitbelow
set splitright

"""
" Nerdtree
"""
" Start up Nerdtree on boot
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

"""
" Airline configuration
"""
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show buffer numbers in tabline
let g:airline#extensions#tabline#buffer_nr_show = 1


"""
" ctrlp configuration
"""
" Set ctrlp to use the opening path always
let g:ctrlp_root_markers = ['.ctrlp']
" Set ctrlp to ignore Archive folder for searching
let g:ctrlp_custom_ignore = "Archive"

"""
" Supertab configuration
"""
let g:SuperTabDefaultCompletionType = "<C-n>"

"""
" Markdown formating
"""
" Formatting for vim-pandoc
let g:pandoc#formatting#mode = 'sa'
let g:pandoc#formatting#textwidth = 80

" Change default spacing for markdown files
autocmd FileType markdown,mkd,md set tabstop=4|set softtabstop=4|set shiftwidth=4
"
" Enable spell checking for markdown files
au BufRead *.md setlocal spell
au BufRead *.markdown setlocal spell

" Configure lexical
augroup lexical
  autocmd!
  autocmd FileType markdown,mkd call lexical#init()
  autocmd FileType textile call lexical#init()
  autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END

" Configure Goyo on enter and exit
function! s:goyo_enter()
  " colorscheme seoul256-light
  syn on " turn on bold and italics highlighting even within Goyo
endfunction
function! s:goyo_leave()
"   colorscheme seoul256
endfunction
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
let g:goyo_width = 80

" Configure vim-slime
let g:slime_target="tmux"
let g:slime_python_ipython=1

" Remap the leader
let mapleader = ","
let maplocalleader = ","
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
" Remap jj to escape insert mode
inoremap fd <ESC>
" Remap leader r to tagbar toggle
nnoremap <leader>r :TagbarToggle<CR>
" Remap F6 to inserting the current datetime
"nnoremap <F6> "=strftime('%c')<CR>P"
"inoremap <F6> <C-R>=strftime('%c')<CR>
" Enable shortcuts for moving elements to the left and right in a vim-table
"nnoremap tl T\|ldt\|lpl
"nnoremap th T\|ldt\|hhhhpbhhhh
" Enable MyPy execution with ,mp
"nnoremap <leader>mp :Mypy<CR>
" Add a docstring in python with ,i
"nmap <silent> <C-i> <Plug>(pydocstring)
