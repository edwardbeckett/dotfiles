" Vim Runtime Configuration
" Edward Beckett
" Init ...
"filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
call pathogen#infect()
filetype plugin indent on
syntax on

source $VIMRUNTIME/mswin.vim
set nocompatible
set mouse=a

if has ( "win32" ) 
   behave mswin
endif   
colorscheme mine
set number
set backspace=2
"set dir=~/_vimswap//,/var/tmp//,/tmp//,.
set dir=$HOME/_vimswap//,%TEMP%//,/%TMP%//,.
