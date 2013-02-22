""""""""""""""""""""""""""""""""""""""""""""
"                                          "
"          GLOBAL SETTINGS                 "
"                                          "
""""""""""""""""""""""""""""""""""""""""""""
" mapleader and maplocal leader at the top 
" so plugins will take it (vim-orgmode)
let maplocalleader = ","
let mapleader = ","
" VIM, not VI
"set nocompatible

"
"" General appearance and behaviour
"
syntax on
" should I keep that ? (see at the bottom filetype off)
filetype plugin indent on
execute pathogen#infect()

" show line,colomn in the status bar
set ruler
" when starting to type a command in normal mode, display it 
set showcmd
" show corresponding bracket
set showmatch
" and show line number
set number
" show tabs / nbsp / trailing spaces
"set listchars=tab:▶\ ,trail:◀,extends:»,precedes:«
"set listchars=nbsp:¤,tab:>·,trail:¤,extends:>,precedes:<
set listchars=nbsp:¤,tab:··,trail:¤,extends:>,precedes:<
set list
" persistent undo
set undofile
set undodir=~/.vim/undodir

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
" disable digraph input to make <^> work faster
set nodigraph

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
" for completion
set showfulltag

" diffopt
" iwhite means ignore whitespace in differences
" filler means scrollbind 
set diffopt=filler,iwhite

" php things moved in ftplugin :)

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

" funny thing: change color according to the day 
"if strftime("%H") < 6 + 0
"	colorscheme darkblue
"	"echo "setting colorscheme to darkblue"
"elseif strftime("%H") < 12 + 0
"	colorscheme morning
"	"echo "setting colorscheme to morning"
"elseif strftime("%H") < 18 + 0
"	colorscheme shine
"	"echo "setting colorscheme to shine"
"else
"	colorscheme evening
"	"echo "setting colorscheme to evening"
"endif
"
set t_Co=256
" set t_Co=512 " oO
colorscheme kalahari " https://raw.github.com/fabi1cazenave/kalahari.vim/master/colors/kalahari.vim
" colorscheme 256_xoria

source $HOME/.vim/mappings.vim

" PATHOGEN / VIM-BUNDLE THING
"filetype plugin indent on
"au! BufRead,BufWrite,BufWritePost,BufNewFile *.org
"au BufEnter *.org            call org#SetOrgFileType()
filetype off               " required!
set runtimepath+=~/.vim/bundle
call vundle#rc()
