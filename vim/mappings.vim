" autocomplete, if you want (requires ctags if I remember)
" imap   <C-Space> <C-X><C-O>

" PHP FOLDING classes, methods and functions
" PHP FOLDING

" My settings     
nmap <silent> <F2> :NERDTreeToggle<CR>    
nnoremap <silent> <F3> :TlistToggle<CR>                                                                       
" open all
nmap <silent> zz zR 



map <F4> :make<CR> " Compile
map <F5> :cwindow<CR> " Ouvre la quickfix si nécessaire
map <C-F9> :cprevious<CR> " Recule d'une erreur
map <F9> :cnext<CR> " Avance d'une erreur

"nmap <F9> :CodeSniffErrorOnly<CR>    
"imap <F9> <Esc>:CodeSniffErrorOnly<CR>a
"nmap <C-F9> :CodeSniff<CR>    
"imap <C-F9> <Esc>:CodeSniff<CR>a


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

"inoremap <F4> <C-O>za
"nnoremap <F4> za
"onoremap <F4> <C-C>za
"vnoremap <F4> zf
:map Q <Nop>

" add new tabs
nmap <C-t> :tabnew<CR>
imap <C-t> <ESC>:tabnew<CR>
" normal mode : switch between tabs with <TAB>/<S-TAB>
nmap <TAB> gt<CR>
nmap <S-TAB> gT<CR>

:map ² :BufExplorer<CR> 

" quit vim if all has been saved
nmap QQ :qa<CR>

" Panic Button
nnoremap <f12> mzggg?G`z
