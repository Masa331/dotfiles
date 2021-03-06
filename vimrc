set encoding=utf-8
lang en_US.UTF-8
set termencoding=utf-8
set fileencodings=utf-8,iso-8859-2
set nocompatible

" ### Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'flazz/vim-colorschemes'
Plugin 'godlygeek/csapprox'
Plugin 'tomtom/tcomment_vim'
Plugin 'othree/html5.vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'vim-scripts/ruby-matchit'
Plugin 'tpope/vim-fugitive'
Plugin 'moll/vim-bbye'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'posva/vim-vue'
" I might not need these plugins. Remove if nothing breaks
" Plugin 'MarcWeber/vim-addon-mw-utils'
" Plugin 'tomtom/tlib_vim'
" Plugin 'xolox/vim-misc'

call vundle#end()

" ### Settings
filetype plugin indent on

set backspace=indent,eol,start
set scrolloff=3
set directory=/tmp
set ruler
set showcmd
set incsearch
set tabstop=2
set shiftwidth=2
set expandtab
set splitbelow
set laststatus=2
set list listchars=tab:»·,trail:·
set ignorecase
set smartcase
set number
set completeopt=longest,menu
set wildmode=list:longest,list:full
set switchbuf=newtab
set hlsearch    " highlight all search results
set noswapfile  " disable swap file

syntax enable
au BufReadPost *.cap set syntax=ruby
au BufRead,BufNewFile *.thor set filetype=ruby
au BufRead,BufNewFile *.csvbuilder set filetype=ruby
au BufRead,BufNewFile *.pgsql set filetype=sql
au BufRead,BufNewFile *.nse set filetype=lua
au BufRead,BufNewFile *.sshconfig set filetype=sshconfig
au BufRead,BufNewFile *.svg set filetype=xml
au BufRead,BufNewFile *.liquid set filetype=html
au BufRead,BufNewFile *.vue set filetype=vue

" ### Vim ColorScheme
colorscheme inkpot

" ### Mappings
map   <silent> <F5> mmgg=G`m^
imap  <silent> <F5> <Esc> mmgg=G`m^
let g:snippetsEmu_key = "<S-Tab>"
nnoremap ; :
" Exit insert mode and save file on F2
:imap <F2> <Esc>:w<CR>

" ### One character append to space+char
:nnoremap <space> :exec "normal a".nr2char(getchar())."\e"<CR>

" ### Leader
let mapleader = ","
map <Leader>g :bp<CR>
map <Leader>h :bn<CR>
map <Leader>x :Bdelete<CR>

" If you use JSX syntax in .js files, which is now becoming standard, add:
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
