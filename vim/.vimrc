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


" Setup of Vundle
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
Plugin 'junegunn/gv.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'easymotion/vim-easymotion'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
Plugin 'majutsushi/tagbar'
Plugin 'craigemery/vim-autotag'
Plugin 'ervandew/supertab'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'reedes/vim-pencil'
Plugin 'godlygeek/csapprox'
Plugin 'jpalardy/vim-slime'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'junegunn/seoul256.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'reedes/vim-wordy'
Plugin 'junegunn/fzf'
Plugin 'Alok/notational-fzf-vim'

if vundleAvailable  == 0
    echo "Installing Vundles, please ignore key map error messages"
    echo ""
    :PluginInstall
endif

" All of your Plugins must be added before the following line
call vundle#end()  " required
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
  set guifont=DejaVu\ Sans\ Mono\ 11
else
  " Set the terminal color for limelight
  let g:limelight_conceal_ctermfg = 240
endif
colorscheme seoul256
let g:airline_theme='distinguished'

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

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show buffer numbers in tabline
let g:airline#extensions#tabline#buffer_nr_show = 1

" Use pencil for markdown  and text files
let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'
let g:pencil#autoformat = 1
" Change default spacing for markdown files
autocmd FileType markdown,mkd set tabstop=4|set softtabstop=4|set shiftwidth=4

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END
let g:pencil#textwidth = 65


" Configure Goyo on enter and exit
function! s:goyo_enter()
  colorscheme seoul256-light
  syn on " turn on bold and italics highlighting even within Goyo
endfunction
function! s:goyo_leave()
  colorscheme seoul256
endfunction
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
let g:goyo_width = 65


" Configure slime to use tmux
let g:slime_target = "tmux"


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
" Remap jj to escape insert mode
inoremap jj <ESC>
" Remap gvim copy and paste
if has('gui_running')
  vmap <C-c> "+yi
  vmap <C-x> "+c
  vmap <C-v> c<ESC>"+p
  imap <C-v> <C-r><C-o>+
endif
" Remap leader r to tagbar toggle
nnoremap <leader>r :TagbarToggle<CR>

" Ignore swapfiles if in a dropbox folder
autocmd BufNewFile,BufRead *
  \ if expand('%:~') =~ '^\~/Dropbox' |
  \   set noswapfile |
  \ else |
  \   set swapfile |
  \ endif

" Enable spell checking for markdown files
au BufRead *.md setlocal spell
au BufRead *.markdown setlocal spell

" Configure nvdirectories
let g:nv_directories = ['~/Notes']
