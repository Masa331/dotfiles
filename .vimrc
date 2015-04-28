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
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'Masa331/vim-snippets'
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'scrooloose/syntastic'
Plugin 'ngmy/vim-rubocop'
Plugin 'vim-scripts/matchit.zip'
Plugin 'vim-scripts/ruby-matchit'
Plugin 'groenewege/vim-less'
Plugin 'briancollins/vim-jst'
Plugin 'bling/vim-airline'
Plugin 'boblin/pgsql.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'moll/vim-bbye'

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

syntax enable
au BufReadPost *.cap set syntax=ruby
au BufRead,BufNewFile *.thor set filetype=ruby
au BufRead,BufNewFile *.pgsql set filetype=sql
au BufRead,BufNewFile *.coffee set filetype=coffee

" ### Vim ColorScheme
colorscheme inkpot
set t_ut=

" ### Airline configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
let g:airline_section_c = "%<%F%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#"
let g:airline_section_b = ""


" ### Mappings
map   <silent> <F5> mmgg=G`m^
imap  <silent> <F5> <Esc> mmgg=G`m^
let g:snippetsEmu_key = "<S-Tab>"
command! Rroutes :e config/routes.rb
command! RTroutes :tabe config/routes.rb
nnoremap ; :

" ### One character append to space+char
:nnoremap <space> :exec "normal a".nr2char(getchar())."\e"<CR>

" ### word a omnicompletition to ctrl-space
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
      \ "\<lt>C-n>" :
      \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
      \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
      \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

let mapleader = ","
map <Leader>g :bp<CR>
map <Leader>h :bn<CR>
map <Leader>x :Bdelete<CR>
