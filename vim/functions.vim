"Simple re-format for minified Javascript
command! UnMinify call UnMinify()
function! UnMinify()
	%s/{\ze[^\r\n]/{\r/g
	%s/){/) {/g
	%s/};\?\ze[^\r\n]/\0\r/g
	%s/;\ze[^\r\n]/;\r/g
	%s/[^\s]\zs[=&|]\+\ze[^\s]/ \0 /g
	normal ggVG=
endfunction

" switch scheme based on http://vim.wikia.com/wiki/Switch_color_schemes

" unlet loaded_switchcolor
if v:version > 700 && !exists('loaded_switchcolor') || ! &cp
	let paths = split(globpath(&runtimepath, 'colors/*.vim'), "\n")
	let s:swcolors = map(paths, 'fnamemodify(v:val, ":t:r")')
	" let s:swskip = [ '256-jungle', '3dglasses', 'calmar256-light', 'coots-beauty-256', 'grb256' ]
	let s:swskip = []
	let s:swback = 0 " background variants light/dark was not yet switched
	let s:swindex = 0

	function! SwitchColor(swinc)
		" if have switched background: dark/light
		if (s:swback == 1)
			let s:swback = 0
			let s:swindex += a:swinc
			let i = s:swindex % len(s:swcolors)
			" in skip list
			if (index(s:swskip, s:swcolors[i]) == -1)
				execute "colorscheme " . s:swcolors[i]
			else
				return SwitchColor(a:swinc)
			endif

		else
			let s:swback = 1
			if (&background == "light")
				execute "set background=dark"
			else
				execute "set background=light"
			endif

			" roll back if background is not supported
			if (!exists('g:colors_name'))
				return SwitchColor(a:swinc)
			endif
		endif

		" show current name on screen. :h :echo-redraw
		redraw
		execute "colorscheme"
	endfunction

	map <F8> :call SwitchColor(1)<CR>
	imap <F8> <Esc>:call SwitchColor(1)<CR>

	map <S-F8> :call SwitchColor(-1)<CR>
	imap <S-F8> <Esc>:call SwitchColor(-1)<CR>

	let loaded_switchcolor = 1
endif


function! Number2price()
	normal cwprice_format2f,dxcct), 2:wklklklklklklklklklklklklklklklklklklklklklklklklklklklklklklklklklklklklklklklklkd*@
endfunction

function! Html2phpScripts()
	.s#<script src="<?php echo BASE_URL ?>\(.\{-}\)" .*$#$this->scripts[BASE_URL.'\1'] = '';#
	echo 'convert <script src="...." to $this->scripts[...] done'
endfunction

function! Html2phpStyle()
	.s#<link rel="stylesheet" href="<?php echo BASE_URL ?>\(.\{-}\)".*$#$this->scripts[BASE_URL.'\1'] = '';#
	echo 'convert <link \(\?:rel="stylesheet"\)\? href="...." to $this->styles[...] done'
endfunction

