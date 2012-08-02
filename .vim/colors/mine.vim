" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Edward Beckett <edward@edwardbeckett.com>
" Last Change:	2012 June 11

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "mine"

hi Normal	guifg=#EBEBEB gui=bold guibg=#010101
hi Title 	guifg=#50A6C2
hi Comment	term=bold		ctermfg=DarkCyan		guifg=#80a0ff
hi Constant	term=underline	ctermfg=Magenta		guifg=Magenta
hi Special	term=bold		ctermfg=DarkMagenta	guifg=Red
hi Identifier term=underline	cterm=bold			ctermfg=Cyan guifg=#40ffff
hi Statement ctermfg=Cyan 	guifg=#CCF0FF
hi PreProc	term=underline	ctermfg=LightBlue	guifg=#ff80ff
hi Type	term=underline		ctermfg=Cyan	guifg=Cyan gui=bold
hi Function	term=bold		ctermfg=White guifg=White
hi Repeat	term=underline	ctermfg=White		guifg=white
hi Operator				ctermfg=Red			guifg=Red
hi Ignore				ctermfg=black		guifg=#0F0F0F
hi Error	term=reverse ctermbg=Red ctermfg=White guibg=Red guifg=White
hi Todo	term=standout ctermbg=Yellow ctermfg=Black guifg=Blue guibg=Yellow
hi Directory term=bold	guifg=#9CB7C9 guibg=#080808	 	
hi ErrorMsg term=standout ctermfg=160 ctermbg=30 guifg=Red guibg=Black
hi LineNr 	term=bold 		guifg=Yellow guibg=#080808
hi CursorLine guibg=#171717	
hi CursorColumn ctermfg=Magenta
hi Folded	guibg=#171717	guifg=#707070 gui=italic
hi FoldColumn guibg=#010101 guifg=#707070
hi NonText	guibg=#010101   guifg=#003366 gui=italic
hi Visual	guibg=#003366	guifg=Cyan 
hi Cursor 	guibg=LightCyan	gui=bold
hi StatusLine gui=bold guibg=#171717 guifg=#50A6C2
hi StatusLineNC gui=bold guibg=#171717 guifg=#777777	 
hi VertSplit gui=italic guibg=#171717	guifg=#003366
hi Search	gui=bold	guibg=Cyan	guifg=#010101
hi WarningMsg gui=bold guifg=Red
hi Field	gui=italic guibg=#171717 guifg=#009900

"hi diffOldFile		diffFile
"hi diffNewFile		diffFile
"hi diffFile		Type
"hi diffOnly		Constant
"hi diffIdentical	Constant
"hi diffDiffer		Constant
"hi diffBDiffer		Constant
"hi diffIsA		Constant
"hi diffNoEOL		Constant
"hi diffCommon		Constant
hi diffDelete	guibg=#242d42	guifg=Red
"hi diffText		gui=underline,bold guibg=#242d42 guifg=#EEEE00
hi diffText		cterm=underline gui=underline,bold ctermfg=Yellow guifg=Yellow guibg=#242d42 
"hi diffChange		guibg=#36648B
hi diffChange		guibg=#242d42 guifg=#777777
"hi diffChanged		guibg=#003587
"hi diffChange		guibg=#181818
hi diffAdd		guibg=#242d42 guifg=Green
"hi diffLine		Statement
"hi diffSubname		PreProc
"hi diffComment		Comment

" Common groups that link to default highlighting.
" You can specify other highlighting easily.
" hi link String	Constant
hi link VisualNOS Visual
hi link String Constant	
hi link Character	Constant
hi link Number	Constant
hi link Boolean	Constant
hi link Float		Number
hi link Conditional	Repeat
hi link Label		Statement
hi link Keyword	Statement
hi link Exception	Statement
hi link Include	PreProc
hi link Define	PreProc
hi link Macro		PreProc
hi link PreCondit	PreProc
hi link StorageClass	Type
hi link Structure	Type
hi link Typedef	Type
hi link Tag		Special
hi link SpecialChar	Special
hi link Delimiter	Special
hi link SpecialComment Special
hi link Debug		Special
