" autocomplete, if you want (requires ctags if I remember)
" imap   <C-Space> <C-X><C-O>
"
" save 1 keystroke on classic keyboard
" use µ to type ^ in normal mode :)
noremap £ ^

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
noremap <F5> :syntax sync fromstart<CR>:diffu<CR>
map <F6> :cwindow<CR> " Ouvre la quickfix si nécessaire
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

"""""""""""""" AZERTY """""""""""""""""""
"noremap § %
" go to previous diff 
noremap µ [c
" go to next diff 
noremap § ]c

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
" Opening closing tabs
map <Leader>tc :tabclose<CR>
map <Leader>td ,bd,tc
map <Leader>tt :tabnew %<CR>
map <Leader>tn :tabnew<CR>

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
"

" Treat long lines as break lines (useful when moving around in them)
nnoremap j gj
nnoremap k gk


" don't work in gnome-terminal -_-
" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
" Move a line of text using ALT+[jk] or Command+[jk] on mac
" ... press <c-V><a-j> to map alt key in gnome-terminal
" let c='a'
" while c <= 'z'
" 	exec "set <M-".toupper(c).">=\e".c
" 	exec "imap \e".c." <M-".toupper(c).">"
" 	let c = nr2char(1+char2nr(c))
" endw

" nmap k :m-2<cr>
" nmap j :m+<cr>
" imap k :m-2<cr>
" imap j :m+<cr>i
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

" LEADER POWER
" to switch lines (need alt)
" nmap <leader>j :m+<cr>``
" nmap <leader>k :m-2<cr>``
" vmap <leader>j  :m'>+<cr>`<my`>mzgv`yo`z
" vmap <leader>k  :m'<-2<cr>`>my`<mzgv`yo`z

" change to directory containing current file
nmap <Leader>cd :cd %:p:h<CR>

" Ctrl-P Buffer
"    nnoremap <Leader>pp :CtrlP<CR>
"    nnoremap <Leader>pb :CtrlPBuffer<CR>
"    nnoremap <Leader>pm :CtrlPMRU<CR>

" Replace " with '
nnoremap <Leader>s' :perldo s/"(.*?)"/'\1'/g<CR>
nnoremap <Leader>s" :perldo s/'(.*?)'/"\1"/g<CR>
vnoremap <Leader>s' :perldo s/"(.*?)"/'\1'/g<CR>
vnoremap <Leader>s" :perldo s/'(.*?)'/"\1"/g<CR>

" Fast reload of common files
nnoremap <Leader>so :so %<CR>
" nnoremap <Leader>sc :so $HOME/.vim/colors/monokai.vim<CR>
nnoremap <Leader>sv :so $MYVIMRC<CR>


" Splitting windows the right way
" Thanks to: http://goo.gl/R73uk
" window
nmap <Leader>sw<Left> :topleft vnew<CR>
nmap <Leader>sw<Right> :botright vnew<CR>
nmap <Leader>sw<Up> :topleft new<CR>
nmap <Leader>sw<Down> :botright new<CR>


" buffer
" or <leader>sh
nmap <Leader>s<Left> :leftabove vnew<CR>
nmap <Leader>sh :leftabove vnew<CR>

nmap <Leader>s<Right> :rightbelow vnew<CR>
nmap <Leader>sl :rightbelow vnew<CR>

nmap <Leader>s<Up> :leftabove new<CR>
nmap <Leader>sk :leftabove vnew<CR>

nmap <Leader>s<Down> :rightbelow new<CR>
nmap <Leader>sj :rightbelow vnew<CR>


" Quick toggles
nmap <Leader>ti :set ignorecase!<CR>
nmap <Leader>tl :set list!<CR>
nmap <Leader>tw :set wrap!<CR>

nnoremap <Leader>y% :let @+ = expand("%:p")<CR>

" inoremap ( ()<left>
" inoremap ' ''<left>
" inoremap " ""<left>
" inoremap [ []<left>
" inoremap < <><left>
" inoremap { {<CR>}<Esc>O

