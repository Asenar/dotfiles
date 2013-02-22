" .vim/ftplugin/php.vim by Tobias Schlitt <toby@php.net>.
" No copyright, feel free to use this, as you like.

"""""""""""""""""""""""""" Asenar """""""""""""""""""""""""""""""""""
" CTRL M : run file with PHP CLI
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

" @TODO add "if $HOME/.vim/plugin/phpfolding !
" requires ~/.vim/plugin/phpfolding.vim 
map <F5> <Esc>:EnableFastPHPFolds<Cr>
map <F6> <Esc>:EnablePHPFolds<Cr>
map <F7> <Esc>:DisablePHPFolds<Cr>
nmap <F8> :set number!<CR>
imap <F8> <Esc>:set number!<CR>a

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" My modifications
set keywordprg=/usr/local/zend/bin/pman
set dictionary+=~/.vim/dic/xdebug2
" END My modifications

" Including PDV is automatic (php_php-doc.vim in ftplugin)
" source ~/.vim/php-doc.vim

" {{{ Settings

" Auto indent after a {
set autoindent
set smartindent
" Linewidth to endless
set textwidth=0

" Do not wrap lines automatically
set nowrap

" Correct indentation after opening a phpdocblock and automatic * on every
" line
set formatoptions=qroct

" Use php syntax check when doing :make
set makeprg=php5\ -l\ %

" Use errorformat for parsing PHP error output
set errorformat+=%m\ in\ %f\ on\ line\ %l

" Switch syntax highlighting on, if it was not
syntax on

" }}} Settings

" {{{ Command mappings

" Map ; to run PHP parser check
" noremap ; :!php5 -l %<CR>

" Map ; to "add ; to the end of the line, when missing"
noremap ; :s/\([^;]\)$/\1;/<cr>

" DEPRECATED in favor of PDV documentation (see below!)
" Map <CTRL>-P to run actual file with PHP CLI
" noremap <C-P> :w!<CR>:!php5 %<CR>


" Map <CTRL>-H to search phpm for the function name currently under the cursor (insert mode only)
inoremap <C-H> <ESC>:!phpm <C-R>=expand("<cword>")<CR><CR>

" Map <CTRL>-0 to alignment function
vnoremap <C-0> :call PhpAlign()<CR>

" Map <CTRL>-u to (un-)comment function
vnoremap <C-u> :call PhpUnComment()<CR>

" }}}


" FUCKING AUTOCLOSE CHARMAP
" {{{ Automatic close char mapping

" More common in PEAR coding standard
" CHANGED; commented version inserted with carriage return; new version does not
" inoremap  { {<CR>}<C-O>O
"inoremap  { {}<LEFT>

" Maybe this way in other coding standards
" inoremap  { <CR>{<CR>}<C-O>O

"inoremap [ []<LEFT>

" Standard mapping after PEAR coding standard
"inoremap ( ()<LEFT>

" Maybe this way in other coding standards
" inoremap ( ( )<LEFT><LEFT> 

"inoremap " ""<LEFT>
"inoremap ' ''<LEFT>

" }}} Automatic close char mapping

" {{{ Wrap visual selections with chars

:vnoremap ( "zdi(<C-R>z)<ESC>
:vnoremap { "zdi{<C-R>z}<ESC>
:vnoremap [ "zdi[<C-R>z]<ESC>
:vnoremap ' "zdi'<C-R>z'<ESC>
" Removed in favor of register addressing
" :vnoremap " "zdi"<C-R>z"<ESC>

" }}} Wrap visual selections with chars

" {{{ Dictionary completion

" The completion dictionary is provided by Rasmus:
" http://lerdorf.com/funclist.txt
set dictionary-=$HOME/.vim/funclist.txt dictionary+=$HOME/.vim/funclist.txt
" Use the dictionary completion
set complete-=k complete+=k

" }}} Dictionary completion

" {{{ Autocompletion using the TAB key

" This function determines, wether we are on the start of the line text (then tab indents) or
" if we want to try autocompletion
"func! InsertTabWrapper()
"    let col = col('.') - 1
"    if !col || getline('.')[col - 1] !~ '\k'
"        return "\<tab>"
"    else
"        return "\<c-p>"
"    endif
"endfunction
"

" Remap the tab key to select action with InsertTabWrapper
"inoremap <tab> <c-r>=InsertTabWrapper()<cr>

" }}} Autocompletion using the TAB key

" {{{ Alignment

func! PhpAlign() range
    let l:paste = &g:paste
    let &g:paste = 0

    let l:line        = a:firstline
    let l:endline     = a:lastline
    let l:maxlength = 0
    while l:line <= l:endline
		if getline (l:line) =~ '^\s*\/\/.*$'
			let l:line = l:line + 1
			continue
		endif
        let l:index = substitute (getline (l:line), '^\s*\(.\{-\}\)\s*=>\{0,1\}.*$', '\1', "") 
        let l:indexlength = strlen (l:index)
        let l:maxlength = l:indexlength > l:maxlength ? l:indexlength : l:maxlength
        let l:line = l:line + 1
    endwhile
    
	let l:line = a:firstline
	let l:format = "%s%-" . l:maxlength . "s %s %s"
    
	while l:line <= l:endline
		if getline (l:line) =~ '^\s*\/\/.*$'
			let l:line = l:line + 1
			continue
		endif
        let l:linestart = substitute (getline (l:line), '^\(\s*\).*', '\1', "")
        let l:linekey   = substitute (getline (l:line), '^\s*\(.\{-\}\) *=>\{0,1\}.*$', '\1', "")
        let l:linesep   = substitute (getline (l:line), '^\s*.* *\(=>\{0,1\}\).*$', '\1', "")
        let l:linevalue = substitute (getline (l:line), '^\s*.* *=>\{0,1\}\s*\(.*\)$', '\1', "")

        let l:newline = printf (l:format, l:linestart, l:linekey, l:linesep, l:linevalue)
        call setline (l:line, l:newline)
        let l:line = l:line + 1
    endwhile
    let &g:paste = l:paste
endfunc

" }}}   

" {{{ (Un-)comment
"
"func! PhpUnComment() range
"    let l:paste = &g:paste
"    let &g:paste = 0
"
"    let l:line        = a:firstline
"    let l:endline     = a:lastline
"
"	while l:line <= l:endline
"		if getline (l:line) =~ '^\s*\/\/.*$'
"			let l:newline = substitute (getline (l:line), '^\(\s*\)\/\/ \(.*\).*$', '\1\2', '')
"		else
"			let l:newline = substitute (getline (l:line), '^\(\s*\)\(.*\)$', '\1// \2', '')
"		endif
"		call setline (l:line, l:newline)
"		let l:line = l:line + 1
"	endwhile
"
"    let &g:paste = l:paste
"endfunc
"
" }}}
