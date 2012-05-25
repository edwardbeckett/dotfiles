call pathogen#infect()
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on
autocmd Vimenter * NERDTree
autocmd Vimenter * wincmd l
autocmd WinEnter * call s:IfNoBuffers()
function! s:IfNoBuffers()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction
nmap <F2> :NERDTreeToggle<CR>
function! SyntaxItem()
	return synIDattr(synID(line("."),col("."),1),"name")
endfunction
":colorscheme mine
:colorscheme ansi_blows 
:set autochdir
:set autoindent
:set autoread
:set filetype=on
:set foldmethod=syntax
:let g:NERDTreeChDirMode=2
:set guicursor=a:ver25-Cursor/lCursor
:set guifont=Monospace\ 12
:set mouse=a
:set hlsearch
:set incsearch
:set number
:set numberwidth=4
:set ruler
:set shiftwidth=4
:set showcmd
:set smartindent
:set splitright
:set statusline+=%{SyntaxItem()}
:set tabstop=4
:syntax enable
