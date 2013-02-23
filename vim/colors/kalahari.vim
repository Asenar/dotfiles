"|
"| File          : ~/.vim/colors/kalahari.vim
"| Last modified : 2012-03-11
"| Project page  : https://github.com/fabi1cazenave/kalahari.vim
"| Author        : Fabien Cazenave
"| Licence       : WTFPL
"| vim           : set fdm=marker:fmr=<<<,>>>:fdl=0:
"|
"| This is a modified 'desert' theme with 256/88-color support.
"|

set background=dark
" no guarantees for version 5.8 and below <<<
if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

" >>>
" source this file on save to apply all changes immediately <<<
if has("autocmd")
  autocmd! bufwritepost kalahari.vim colorscheme kalahari
endif ">>>
let g:colors_name="kalahari"

" GUI colors for gVim, adapted from 'desert' <<<
if has("gui_running")
  hi Normal       guifg=White        guibg=grey10
  hi NonText      guifg=grey70       guibg=grey15     gui=bold
 "hi NonText      guifg=LightBlue    guibg=grey30

  " highlight groups <<<
 "hi Cursor       guibg=khaki        guifg=slategrey
  hi Cursor       guifg=grey20       guibg=green
  hi CursorLine                      guibg=grey20     gui=none
 "hi CursorIM
 "hi Directory
 "hi DiffAdd
 "hi DiffChange
 "hi DiffDelete
 "hi DiffText
 "hi ErrorMsg
 "hi Folded       guifg=gold         guibg=grey30
  hi Folded       guifg=tan          guibg=grey30
  hi FoldColumn   guifg=tan          guibg=grey30
  hi IncSearch    guifg=slategrey    guibg=khaki
 "hi LineNr       guifg=grey50       guibg=grey20
 "hi LineNr       guifg=grey50       guibg=grey10
 "hi LineNr       guifg=black        guibg=grey50
  hi LineNr       guifg=grey50
  hi ModeMsg      guifg=goldenrod
  hi MoreMsg      guifg=SeaGreen
  hi Question     guifg=springgreen
  hi Search       guifg=wheat        guibg=peru
  hi SpecialKey   guifg=yellowgreen
  hi StatusLine   guifg=black        guibg=#c2bfa5    gui=bold
 "hi StatusLineNC guifg=grey50       guibg=#c2bfa5   "gui=italic
  hi StatusLineNC guifg=black        guibg=grey50     gui=none
  hi TabLine      guifg=white        guibg=grey30     gui=underline
  hi TabLineFill                     guibg=grey30     gui=none
 "hi TabLineSel   ctermfg=167  ctermbg=238
  hi Title        guifg=indianred
 "hi VertSplit    guifg=grey50       guibg=#c2bfa5   "gui=none
  hi VertSplit    guifg=grey30       guibg=grey50     gui=none
  hi Visual       guifg=khaki        guibg=olivedrab  gui=none
 "hi VisualNOS
  hi WarningMsg   guifg=salmon
 "hi WildMenu
 "hi Menu
 "hi Scrollbar
 "hi Tooltip
  ">>>

  " syntax highlighting groups <<<
 "hi Comment      guifg=SkyBlue
  hi Comment      guifg=grey60
  hi Constant     guifg=#ffa0a0
  hi Identifier   guifg=palegreen
 "hi Statement    guifg=khaki
 "hi Statement    guifg=goldenrod
  hi Statement    guifg=#44aaff                       gui=bold
  hi PreProc      guifg=indianred
 "hi Type         guifg=darkkhaki
  hi Type         guifg=goldenrod                     gui=none
  hi Special      guifg=navajowhite
 "hi Underlined
  hi Ignore       guifg=grey40
 "hi Error
  hi Todo         guifg=orangered    guibg=yellow2
  ">>>

">>>
" 256-color mode, adapted from 'desert256' <<<
elseif &t_Co == 256
  hi Normal       ctermfg=255  ctermbg=234
  hi NonText      ctermfg=152  ctermbg=235  cterm=bold
 "hi NonText      ctermfg=152  ctermbg=238  cterm=bold
 "hi NonText      ctermfg=152  ctermbg=16   cterm=bold

  " highlight groups <<<
  hi Cursor       ctermfg=66   ctermbg=222
 "hi CursorColumn ctermbg=242
  hi CursorLine                ctermbg=237  cterm=none
 "hi DiffAdd      ctermbg=4
 "hi DiffChange   ctermbg=5
 "hi DiffDelete   ctermfg=12   ctermbg=6
 "hi DiffText     ctermbg=9                 cterm=bold
 "hi Directory    ctermfg=159
 "hi ErrorMsg     ctermfg=15   ctermbg=1
  hi FoldColumn   ctermfg=180  ctermbg=239
  hi Folded       ctermfg=180  ctermbg=239
  hi IncSearch    ctermfg=66   ctermbg=222  cterm=reverse
  hi LineNr       ctermfg=244
 "hi MatchParen   ctermbg=6
  hi ModeMsg      ctermfg=178               cterm=bold
  hi MoreMsg      ctermfg=29
 "hi Pmenu        ctermbg=13
 "hi PmenuSbar    ctermbg=248
 "hi PmenuSel     ctermbg=242
 "hi PmenuThumb                             cterm=reverse
  hi Question     ctermfg=48                cterm=bold
  hi Search       ctermfg=223  ctermbg=172
 "hi SignColumn   ctermfg=14   ctermbg=242
  hi SpecialKey   ctermfg=111
 "hi SpellBad     ctermbg=9
 "hi SpellCap     ctermbg=12
 "hi SpellLocal   ctermbg=14
 "hi SpellRare    ctermbg=13
  hi StatusLine   ctermfg=145  ctermbg=16   cterm=reverse,bold
 "hi StatusLineNC ctermfg=145  ctermbg=243  cterm=none
  hi StatusLineNC ctermfg=0    ctermbg=243  cterm=none
  hi TabLine      ctermfg=15   ctermbg=239  cterm=underline
  hi TabLineFill               ctermbg=239  cterm=none
 "hi TabLineFill               ctermbg=250  cterm=none
 "hi TabLineSel   ctermfg=167  ctermbg=238
 "hi TabLineSel                             cterm=bold
  hi Title        ctermfg=167               cterm=bold
  hi VertSplit    ctermfg=238  ctermbg=243  cterm=none
  hi Visual       ctermfg=64   ctermbg=222  cterm=reverse
 "hi VisualNOS                              cterm=bold,underline
  hi WarningMsg   ctermfg=209
 "hi WildMenu     ctermfg=0    ctermbg=11
  ">>>

  " syntax highlighting groups <<<
 "hi Comment      ctermfg=117
 "hi Comment      ctermfg=250
  hi Comment      ctermfg=247
  hi Constant     ctermfg=217
 "hi Error        ctermfg=15   ctermbg=9
  hi Identifier   ctermfg=120
  hi Ignore       ctermfg=240
  hi PreProc      ctermfg=167
  hi Special      ctermfg=223
 "hi Statement    ctermfg=178               cterm=bold
 "hi Statement    ctermfg=117               cterm=bold
 "hi Statement    ctermfg=45                cterm=bold
  hi Statement    ctermfg=39                cterm=bold
 "hi Todo         ctermfg=196  ctermbg=226
 "hi Todo         ctermfg=217  ctermbg=196
  hi Todo         ctermfg=255  ctermbg=167
 "hi Type         ctermfg=143               cterm=bold
  hi Type         ctermfg=178
 "hi Underlined   ctermfg=81                cterm=underline
  ">>>

">>>
" 88-color mode, adapted from 'desert256' <<<
elseif &t_Co == 88
  hi Normal       ctermfg=87   ctermbg=16
  hi NonText      ctermfg=59   ctermbg=80   cterm=bold

  " highlight groups <<<
  hi Cursor       ctermfg=12   ctermbg=77
  hi CursorLine                ctermbg=81   cterm=none
  hi FoldColumn   ctermfg=57   ctermbg=80
 "hi Folded       ctermfg=72   ctermbg=80
  hi Folded       ctermfg=53   ctermbg=80
  hi IncSearch    ctermfg=37   ctermbg=77   cterm=reverse
 "hi LineNr       ctermfg=11
  hi LineNr       ctermfg=83
  hi ModeMsg      ctermfg=52                cterm=bold
  hi MoreMsg      ctermfg=21
  hi Question     ctermfg=29
  hi Search       ctermfg=74   ctermbg=52
  hi SpecialKey   ctermfg=40
  hi StatusLine   ctermfg=58   ctermbg=16   cterm=reverse,bold
  hi StatusLineNC ctermfg=0    ctermbg=82   cterm=none
  hi TabLine      ctermfg=15   ctermbg=82   cterm=underline
  hi TabLineFill               ctermbg=84   cterm=none
  hi Title        ctermfg=53
  hi VertSplit    ctermfg=80   ctermbg=82   cterm=none
  hi Visual       ctermfg=36   ctermbg=77   cterm=reverse
  hi WarningMsg   ctermfg=69
  ">>>

  " syntax highlighting groups <<<
  hi Comment      ctermfg=43
  hi Constant     ctermfg=69
  hi Identifier   ctermfg=45
  hi Ignore       ctermfg=81
 "hi Preproc      ctermfg=53
  hi Preproc      ctermfg=65
 "hi Preproc      ctermfg=64
 "hi Preproc      ctermfg=1
  hi Special      ctermfg=74
 "hi Statement    ctermfg=77                cterm=bold
  hi Statement    ctermfg=52                cterm=bold
  hi Todo         ctermfg=68   ctermbg=76
  hi Type         ctermfg=57                cterm=bold
  ">>>

">>>
" default color terminal definitions <<<
else
  hi Comment      ctermfg=darkcyan
  hi Constant     ctermfg=brown
  hi DiffAdd                         ctermbg=4
  hi DiffChange                      ctermbg=5
  hi DiffDelete   ctermfg=4          ctermbg=6      cterm=bold
  hi DiffText                        ctermbg=1      cterm=bold
  hi Directory    ctermfg=darkcyan
  hi Error        ctermfg=7          ctermbg=1      cterm=bold
  hi Errormsg     ctermfg=7          ctermbg=1      cterm=bold
  hi FoldColumn   ctermfg=darkgrey   ctermbg=none
  hi Folded       ctermfg=darkgrey   ctermbg=none
  hi Identifier   ctermfg=6
  hi Ignore       ctermfg=7                         cterm=bold
  hi Ignore       ctermfg=darkgrey
  hi IncSearch    ctermfg=yellow     ctermbg=green  cterm=none
 "hi LineNr       ctermfg=3
  hi LineNr       ctermfg=grey
  hi ModeMsg      ctermfg=brown                     cterm=none
  hi MoreMsg      ctermfg=darkgreen
  hi NonText      ctermfg=darkblue                  cterm=bold
  hi Preproc      ctermfg=5
  hi Question     ctermfg=green
  hi Search       ctermfg=grey       ctermbg=blue   cterm=none
  hi Special      ctermfg=5
  hi SpecialKey   ctermfg=darkgreen
  hi Statement    ctermfg=3
  hi StatusLine                                     cterm=bold,reverse
  hi StatusLineNC                                   cterm=reverse
  hi Title        ctermfg=5
  hi Type         ctermfg=2
  hi Underlined   ctermfg=5                         cterm=underline
  hi VertSplit                                      cterm=reverse
  hi Visual                                         cterm=reverse
  hi VisualNOS                                      cterm=bold,underline
  hi WarningMsg   ctermfg=1
  hi WildMenu     ctermfg=0          ctermbg=3
endif
">>>

" vim: set foldmethod=marker foldmarker=<<<,>>> foldlevel=0:

