" ### Basic settings ###

set encoding=utf-8
lang en_US.UTF-8
set termencoding=utf-8
set fileencodings=utf-8,iso-8859-2
set nocompatible
filetype off

" ### Bundle manager Vundle

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-rails'
" Parove elementy kolem slov/vet/etc - uvozovky/tagy/etc
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-vividchalk'
" komentovani c gc
Bundle 'tomtom/tcomment_vim'
" Utility
Bundle 'MarcWeber/vim-addon-mw-utils'
" Utility
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
Bundle 'othree/html5.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'kchmck/vim-coffee-script'
Bundle 'scrooloose/syntastic'
Bundle 'ngmy/vim-rubocop'
Bundle 'vim-scripts/matchit.zip'
Bundle 'vim-scripts/ruby-matchit'
" Bundle 'mattn/emmet-vim'
" Bundle 'ecomba/vim-ruby-refactoring'
" Bundle 'thoughtbot/vim-rspec'
" Bundle 'tpope/vim-markdown'
" Bundle 'tsaleh/vim-supertab'
" Bundle 'vim-ruby/vim-ruby'
" Bundle 'vim-bundles/fuzzyfinder'
" Bundle 'airblade/vim-gitgutter'
" Bundle 'astashov/vim-ruby-debugger'
" Bundle 'timcharper/textile.vim'
" Bundle 'tpope/vim-cucumber'
" Bundle 'tpope/vim-bundle'
" Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'
" Bundle 'mileszs/ack.vim'
" Bundle 'godlygeek/tabular'
" Bundle 'tpope/vim-endwise'
" Bundle 'tpope/vim-commentary'

" ### Other settings ###

filetype plugin indent on " required!
set backspace=indent,eol,start
set scrolloff=3
set directory=/tmp
set nobackup
set noswapfile
set nowritebackup
set history=500
set undolevels=200
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

" Syntastic options
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
set statusline=%<%f\ %h%m%r%#warningmsg#%{SyntasticStatuslineFlag()}%=%-14.(%l,%c%V%)\ %P
" jruby macruby mri rubocop rubylint
" let g:syntastic_ruby_checkers = ['rubocop']
" ####################

syntax on
colorscheme vividchalk
hi Comment guifg=#9c998e gui=none

" Local config
if filereadable(".vimrc.local")
  source .vimrc.local
endif

if has("autocmd")
  augroup vimrcEx
    au!
    autocmd FileType text setlocal textwidth=78
    autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal g`\"" |
          \ endif
  augroup END
else
  set autoindent		" always set autoindenting on
endif


" ### Mappings ###

" ident
map   <silent> <F5> mmgg=G`m^
imap  <silent> <F5> <Esc> mmgg=G`m^
let g:snippetsEmu_key = "<S-Tab>"
command! Rroutes :e config/routes.rb
command! RTroutes :tabe config/routes.rb
nnoremap ; :

" let mapleader = ","
" map <Leader>R :e doc/README_FOR_APP<CR>
" map <Leader>m :Rmodel 
" map <Leader>c :Rcontroller 
" map <Leader>v :Rview 
" map <Leader>h :Rhelper 
" map <Leader>tm :RTmodel 
" map <Leader>tmi :RTmigration 
" map <Leader>tc :RTcontroller 
" map <Leader>tv :RTview 
" map <Leader>tu :RTunittest 
" map <Leader>sm :RSmodel 
" map <Leader>sc :RScontroller 
" map <Leader>sv :RSview 
" map <Leader>su :RSunittest 
" map <Leader>sf :Rspec features/
" map <Leader>l :Rlocale 
" map <Leader>fa :find spec/factories<CR>
" map <Leader>g :find Gemfile<CR>
" Opens an edit or tabedit command with the path of the currently edited file filled in
" map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
" map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>
" "refactor
" nnoremap <leader>rif :RConvertPostConditional<cr>

" ### Archive ###

" Simple switch to paste mode
" set pastetoggle=<F2>

" Don't use Ex mode, use Q for formatting
" map Q gq

" No Help, please
" nmap <F1> <Esc>

" Duplicate a selection
" Visual mode: D
" vmap D y'>p

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
" if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
"   syntax on
"   set hlsearch
" endif

" set default font
" if (has("gui_running"))
"   set guifont=terminus
" endif
"

" aby fungovaf fuzzyfinder
" http://bitbucket.org/ns9tks/vim-fuzzyfinder/issue/6/fuzzyfinder-not-working-in-gvim-72
" map <Leader>f :FufFile<cr>
" map ff :FufFile<cr>
" map mr :MRU<cr>

" Press ^F from insert mode to insert the current file name
" imap <C-F> <C-R>=expand("%")<CR>

" Use Ack instead of Grep when available
" if executable("ack")
"   set grepprg=ack\ -H\ --nogroup\ --nocolor
" endif

" Maps autocomplete to tab
" Maps autocomplete to tab
" imap <Tab> <C-N>
" imap <Tab> <C-N>

"snipmate setup
" try
"   source ~/.vim/bundle/snipmate-snippets/support_functions.vim
" endtry
" autocmd vimenter * call s:SetupSnippets()
" function! s:SetupSnippets()
:"   "if we're in a rails env then read in the rails snippets
" if filereadable("./config/environment.rb")
" call ExtractSnipsFile('~/.vim/snippets/eruby.snippets', 'eruby')
"     call ExtractSnips("~/.vim/bundle/snipmate-snippets/ruby/", "ruby")
"     call ExtractSnips("~/.vim/bundle/snipmate-snippets/ruby-rails/", "ruby")
"     call ExtractSnips("~/.vim/bundle/snipmate-snippets/eruby/", "eruby")
"     call ExtractSnips("~/.vim/bundle/snipmate-snippets/eruby-rails/", "eruby")
"     call ExtractSnips("~/.vim/bundle/snipmate-snippets/cucumber/", "cucumber")
"     call ExtractSnips("~/.vim/bundle/snipmate-snippets/html/", "eruby")
" endif
" 
"   call ExtractSnips("~/.vim/bundle/snipmate-snippets/html/", "xhtml")
" endfunction
