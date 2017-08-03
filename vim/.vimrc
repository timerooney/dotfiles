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
Plugin '907th/vim-auto-save'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'lifepillar/vim-solarized8'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tpope/vim-surround'
Plugin 'majutsushi/tagbar'
Plugin 'craigemery/vim-autotag'
Plugin 'ervandew/supertab'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'freitass/todo.txt-vim'
Plugin 'godlygeek/csapprox'
Plugin 'jpalardy/vim-slime'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'junegunn/seoul256.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'reedes/vim-wordy'
Plugin 'junegunn/fzf'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-salve'
Plugin 'Shougo/vimproc.vim'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'eagletmt/neco-ghc'

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


"""
" Colorscheme configuration
"""
" 256 colors
set t_Co=256
" Colorscheme
if has('gui_running')
  set guifont=DejaVu\ Sans\ Mono\ 11
  colorscheme solarized8_light_high
  let g:airline_theme='solarized'
else
  " Set the terminal color for limelight
  let g:limelight_conceal_ctermfg = 240
  colorscheme PaperColor
  let g:airline_theme='silver'
endif


"""
" General vim configuration
"""
syntax on

" Indentation settings
set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2
set autoindent
set smartindent

" General preferences
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

" Ignore swapfiles if in a dropbox folder
autocmd BufNewFile,BufRead *
  \ if expand('%:~') =~ '^\~/Dropbox' |
  \   set noswapfile |
  \ else |
  \   set swapfile |
  \ endif


"""
" Nerdtree
"""
" Start up nerdtree on boot
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
" ctrlp configuraiton
"""
" Set ctrlp to use the opening path always
let g:ctrlp_root_markers = ['.ctrlp']
" Set ctrlp to ignore Archive folder for searching
let g:ctrlp_custom_ignore = "Archive"


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

" Configure vim-table-mode
let g:table_mode_corner='|'


"""
" Slime
"""
" Configure slime to use tmux
let g:slime_target = "tmux"


"""
" Haskell configuration
"""
" Configure Haskell autocompletion
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = "<c-n>"
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc


" Remappings "

" Remap the leader
let mapleader = ","
let maplocalleader = ","
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
" Remap F6 to inserting the current datetime
nnoremap <F6> "=strftime('%c')<CR>P"
inoremap <F6> <C-R>=strftime('%c')<CR>
" Enable shortcuts for moving elements to the left and right in a vim-table
nnoremap tl T\|ldt\|lpl
nnoremap th T\|ldt\|hhhhpbhhhh


"""
" Last steps
"""
" Automatically start gVim fullscreen on Windows
" autocmd GUIEnter * simalt ~x
