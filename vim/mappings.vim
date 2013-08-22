" autocomplete, if you want (requires ctags if I remember)
" imap   <C-Space> <C-X><C-O>

" PHP FOLDING classes, methods and functions
" PHP FOLDING

" My settings     
" open all
nmap <silent> zz zR 


"nmap <silent> <F2> :NERDTreeToggle<CR>
"nnoremap <silent> <F3> :TlistToggle<CR>
" toggle fold
"inoremap <F4> <C-O>za
"nnoremap <F4> za
"onoremap <F4> <C-C>za
" create a new fold
"vnoremap <F4> zf
"map <F4> :make<CR> " Compile
" refresh syntax
noremap <F5> :syntax sync fromstart<CR>
map <F6> :cwindow<CR> " Ouvre la quickfix si nécessaire
nmap <F7> <ESC>:PomodoroStart<CR>
imap <F7> <ESC>:PomodoroStart<CR>a
nmap <F8> :set number!<CR>
imap <F8> <Esc>:set number!<CR>a
map <S-F9> :cprevious<CR> " Recule d'une erreur
map <F9> :cnext<CR> " Avance d'une erreur
"nmap <F9> :CodeSniffErrorOnly<CR>
"imap <F9> <Esc>:CodeSniffErrorOnly<CR>a
"nmap <C-F9> :CodeSniff<CR>
"imap <C-F9> <Esc>:CodeSniff<CR>a
" Panic Button
nnoremap <F12> mzggg?G`z
inoremap <C-P><ESC> :call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
" Map <ctrl>+p to multi line mode documentation (in visual mode)
vnoremap <C-P> :call PhpDocRange()<CR>

" "sudo" save: command map w!! 
:cmap w!! w !sudo tee % >/dev/null

" This is for mouse scrolling (primarily in GVIM)
:map <M-Esc>[62~ <MouseDown>
:map! <M-Esc>[62~ <MouseDown>
:map <M-Esc>[63~ <MouseUp>
:map! <M-Esc>[63~ <MouseUp>
:map <M-Esc>[64~ <S-MouseDown>
:map! <M-Esc>[64~ <S-MouseDown>
:map <M-Esc>[65~ <S-MouseUp>
:map! <M-Esc>[65~ <S-MouseUp>

:map <Leader>s :set hlsearch<CR>
:map <Leader>S :set nohlsearch<CR>

" search next/previous diff                                                                                                
noremap § %
noremap % [c
noremap ù ]c

" Map <leader>f to split horizontally, and move to bottom window
nnoremap <leader>f <C-w>s<C-w>j
" and use <ctrl> plus direction key to move around within windows
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l

"nmap <F6> :set number!<CR>
nmap <silent> zz zR
" from tuppervim-mars?
inoremap <F4> <C-O>za
nnoremap <F4> za
onoremap <F4> <C-C>za
vnoremap <F4> zf
:map Q <Nop>

" add new tabs
nmap <C-t> :tabnew<CR>
imap <C-t> <ESC>:tabnew<CR>
" normal mode : switch between tabs with <TAB>/<S-TAB>
nmap <TAB> gt<CR>
nmap <S-TAB> gT<CR>

map ² :BufExplorer<CR>

" quit vim if all has been saved;
nmap QQ :qa<CR>

" lazy escape
inoremap kj <Esc>
cnoremap kj <Esc>

" for real men
    noremap <up> <nop>
    noremap <down> <nop>
    noremap <left> <nop>
    noremap <right> <nop>
"   inoremap <up> <nop>
"   vnoremap <up> <nop>
"   inoremap <down> <nop>
"   vnoremap <down> <nop>
"   inoremap <left> <nop>
"   vnoremap <left> <nop>
"   inoremap <right> <nop>
"   vnoremap <right> <nop>

" don't work in gnome-terminal -_-
" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
" Move a line of text using ALT+[jk] or Command+[jk] on mac
" ... press <c-V><a-j> to map alt key in gnome-terminal
" nmap j :m+<cr>``
" nmap k :m-2<cr>``
" vmap j  :m'>+<cr>`<my`>mzgv`yo`z
" vmap k  :m'<-2<cr>`>my`<mzgv`yo`z
" nmap <a-j> :m+<cr>``
" nmap <a-k>  :m-2<cr>``
" vmap <a-j>  :m'>+<cr>`<my`>mzgv`yo`z
" vmap <a-k>  :m'<-2<cr>`>my`<mzgv`yo`z
" nmap <m-j> :m+<cr>``
" nmap <m-k>  :m-2<cr>``
" vmap <m-j>  :m'>+<cr>`<my`>mzgv`yo`z
" vmap <m-k>  :m'<-2<cr>`>my`<mzgv`yo`z
