""""""""""""""""""""""""""""""""""""""""""""
"                                          "
"          GLOBAL SETTINGS                 "
"                                          "
""""""""""""""""""""""""""""""""""""""""""""

" VIM, not VI
"set nocompatible

"
"" General appearance and behaviour
"
syntax on
filetype plugin indent on

" show line,colomn in the status bar
set ruler
" when starting to type a command in normal mode, display it 
set showcmd
" show corresponding bracket
set showmatch
" and show line number
set number

" wildmenu show possible matches above the command line
set nowildmenu
" see :help wildmode for all options available
" full means complete the next full match
set wildmode=full
" backspace do a backspace :=)
set backspace=indent,eol,start
" do not automatically go to newline
set nowrap
" I do not want to automatically breaks if lines are too long.
set nolinebreak
" don't load modelines... (see :help modeline
set nomodeline

" 80 col. in vim7.3 I could use columncolor
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/
if exists('+colorcolumn')
  set colorcolumn=120
else
	au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>120v.\+', -1)
  "set colorcolumn=120
endif

"
"" Search options
" I don't want to show matches while typing search
"set incsearch
" highlight search
set hlsearch
" ignorecase + smartcase to search case not sensitive if all is lowercase
set ignorecase
set smartcase

"
"" Indentation options
" cindent may be better than smartindent or autoindent
set cindent
"set smartindent
" do not convert tabs to spaces
set noexpandtab
" Number of spaces that a <Tab> counts for while performing edit
set softtabstop=2
" Number of spaces to use for each step of indent
set shiftwidth=2
" number of spaces that a <Tab> in the file counts for
set tabstop=2
" minimal number of screen lines to keep above and below cursor
set scrolloff=1
" encoding utf8, what else ?
set encoding=utf8
" current line has a different color :)
set cursorline

" diffopt
" iwhite to ignore whitespace in differences
" filler to scrollbind 
set diffopt=filler,iwhite

" @TODO fix
if match($TERM, '256color$') != -1
  set background=dark
	set t_Co=256
  colorscheme 256_xoria
else
  set background=dark
	colorscheme kalahari
endif


" CTRL M : run file with PHP CLI (notice: <CTRL+M> = <CR> -_-
"autocmd FileType php noremap <C-M> :!/usr/bin/php %<CR>
" CTRL L : PHP parser check
autocmd FileType php noremap <C-L> :!/usr/bin/php -l %<CR>
" CTRL K CodeSniffer (il faut configurer codesniffer comme il faut, ou ajouter --standard=Prestashop )
autocmd FileType php noremap <C-K> :!phpcs %<CR>
" completion automatique
"imap   <C-Space> <C-X><C-O>

" uncomment to disable phpfolding at opening (If I remember)
" let phpfolding=0
" requires ~/.vim/after/ftplugin/php_localvarcheck
"let g:php_localvarcheck_enable=1
let g:php_localvarcheck_enable=0
let g:php_localvarcheck_global=0

" Load a tag file
" Loads a tag file from ~/.vim.tags/, based on the argument provided. The
" command "Ltag"" is mapped to this function.
:function! LoadTags(file)
:   let tagspath = $HOME . "/.vim.tags/" . a:file
:   let tagcommand = 'set tags+=' . tagspath
:   execute tagcommand
:endfunction
:command! -nargs=1 Ltag :call LoadTags("<args>")

" deactivate zencoding
let g:loaded_zencoding_vim = 0

source $HOME/.vim/mappings.vim
