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

" required by quickfixsigns
set lazyredraw
" update quickfixsigns always (need to be before pathogen#infect)
let g:quickfixsigns_events = ['BufEnter', 'CursorHold', 'CursorHoldI', 'InsertLeave', 'InsertEnter', 'InsertChange', 'CursorMoved', 'CursorMovedI']
"
"" General appearance and behaviour
"
execute pathogen#infect()
" doc in bundle are now included :)
Helptags
syntax on
" should I keep that ? (see at the bottom filetype off)
filetype plugin indent on

" use µ to type ^ in normal mode :)
noremap £ ^
" show tabline even when 1 tab
set showtabline=2
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
"set listchars=nbsp:¤,tab:··,trail:¤,extends:>,precedes:<
"set list
" persistent undo
" set undofile
" set undodir=~/.vim/undodir

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
set scrolloff=5
" encoding utf8, what else ? fileencoding maybe
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
" @TODO fix
if match($TERM, '256color$') != -1
	set background=dark
	set t_Co=256
	colorscheme 256_xoria
else
	set t_Co=256
	set background=dark
	colorscheme kalahari
endif

colorscheme kalahari
set background=dark
set background=light
set background=dark
set t_Co=256


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
"echo "setting colorscheme to darkblue"
"elseif strftime("%H") < 12 + 0
"	colorscheme morning
"echo "setting colorscheme to morning"
"elseif strftime("%H") < 18 + 0
"	colorscheme shine
"echo "setting colorscheme to shine"
"else
"	colorscheme evening
"echo "setting colorscheme to evening"
"endif
"
set t_Co=256
" set t_Co=512 " oO
colorscheme kalahari " https://raw.github.com/fabi1cazenave/kalahari.vim/master/colors/kalahari.vim
" colorscheme 256_xoria

source $HOME/.vim/mappings.vim
source $HOME/.vim/functions.vim

autocmd Filetype gitcommit setlocal spell textwidth=72



" Duration of a pomodoro in minutes (default: 25)
let g:pomodoro_time_work = 25
" Duration of a break in minutes (default: 5)
let g:pomodoro_time_slack = 5 
" Log completed pomodoros, 0 = False, 1 = True (default: 0)
let g:pomodoro_do_log = 1
" Path to the pomodoro log file (default: /tmp/pomodoro.log)
let g:pomodoro_log_file = "/tmp/pomodoro.log" 
let g:pomodoro_notification_cmd = 'zenity --notification --text="Pomodoro finished"'
set laststatus=2

"set statusline+=%#InfoMsg#%{PomodoroStatus()}%#StatusLine#
" set statusline=%n%0F%m%r%h%w%q#%{echo " "}#%{PomodoroStatus()}%#StatusLine#
" set statusline=%t       "tail of the filename
" set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
" set statusline+=%{&ff}] "file format
" set statusline+=%h      "help file flag
" set statusline+=%m      "modified flag
" set statusline+=%r      "read only flag
" set statusline+=%y      "filetype
" set statusline+=%=      "left/right separator
" set statusline+=%{PomodoroStatus()}      "left/right separator
""  set statusline+=%c,     "cursor column
""  set statusline+=%l/%L   "cursor line/total lines
" set statusline+=\ %P    "percent through file
" statusline
" cf the default statusline: %<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
" format markers:
"   %< truncation point
"   %n buffer number
"   %f relative path to file
"   %m modified flag [+] (modified), [-] (unmodifiable) or nothing
"   %r readonly flag [RO]
"   %y filetype [ruby]
"   %= split point for left and right justification
"   %-35. width specification
"   %l current line number
"   %L number of lines in buffer
"   %c current column number
"   %V current virtual column number (-n), if different from %c
"   %P percentage through buffer
"   %) end of width specification
" set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P%{PomodoroStatus()}

iabbrev _date <C-r>=strftime('%Y-%m-%d')<CR>
" http://www.vimtweets.com/tips.json
" au VimEnter * echomsg system('/usr/games/fortune -o -s')

let g:syntastic_check_on_open=0
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
" let g:syntastic_mode_map = { 'mode': 'passive'}

" Set a white cursor in insert mode, and a red cursor otherwise.
" Works at least for xterm and rxvt terminals.
" src: http://vim.wikia.com/wiki/Configuring_the_cursor
" @see: :h t_EI
if &term =~ "xterm\\|rxvt"
  let &t_EI = "\033]12;white\007"
  let &t_SI = "\033]12;red\007"
  :silent !echo -ne "\033]12;white\007"
  autocmd VimLeave * :silent :!echo -ne "\033]12;white\007"
endif
if &term =~ "screen"
"let &t_EI = "\033P\033]12;white\007\033\\"
"let &t_SI = "\033P\033]12;red\007\033\\"
":silent !echo -ne "\033P\033]12;white\007\033\\"
  autocmd InsertLeave * :silent :!echo -ne "\033P\033]12;white\007\033\\"
  autocmd InsertEnter * :silent :!echo -ne "\033P\033]12;red\007\033\\"
  autocmd VimLeave * :silent :!echo -ne "\033P\033]12;white\007\033\\"
  set term=xterm
endif
autocmd InsertLeave * hi StatusLine ctermbg=black
autocmd InsertEnter * hi StatusLine ctermbg=red

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

