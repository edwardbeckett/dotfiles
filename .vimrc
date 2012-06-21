" Vim Runtime Configuration
" Edward Beckett
" Init ...

	filetype off
	call pathogen#infect()
	call pathogen#runtime_append_all_bundles()
	call pathogen#helptags()
	filetype plugin indent on

" Vim Configs

	colorscheme mine
	"set autochdir
	set autoindent
	set autoread
	set backspace=indent,eol,start
	set clipboard=autoselect,exclude:cons\\\|linux
	set columns=120
	set fillchars+=vert:\~,stl:\ ,stlnc:\    
	set foldmethod=indent
	set nofoldenable
	set foldnestmax=10
	set foldlevel=1
	set gdefault
	set guicursor=a:ver25-Cursor/lCursor
	set guifont=Menlo:h14
	set mouse=a
	set hlsearch
	set incsearch
	set linebreak
	set number
	set numberwidth=4
	set ruler
	set sel=inclusive
	set shiftwidth=4
	set showcmd
	set showmode
	set smartindent
	set softtabstop=4
	set splitright
	set scrolloff=2
	set statusline=%<%F\ %m%r\ %=\ %y%{&ff}\ line:%l\ col:%c\ \   
	set tabstop=4
	set visualbell
	set wildmenu
	set wildmode=list:longest,full
	syntax enable 

" Plugin Functions

	function! s:IfNoBuffers()
	  if exists("t:NERDTreeBufName")
		if bufwinnr(t:NERDTreeBufName) != -1
		  if winnr("$") == 1
			q
		  endif
		endif
	  endif
	endfunction

	function s:CommandCabbr(abbreviation, expansion)
	  execute 'cabbrev ' . a:abbreviation . ' <c-r>=getcmdpos() == 1 && getcmdtype() == ":" ? "' . a:expansion . '" : "' . a:abbreviation . '"<CR>'
	endfunction

	function s:FileCommand(name, ...)
	  if exists("a:1")
		let funcname = a:1
	  else
		let funcname = a:name
	  endif

	  execute 'command -nargs=1 -complete=file ' . a:name . ' :call ' . funcname . '(<f-args>)'
	endfunction

	function s:DefineCommand(name, destination)
	  call s:FileCommand(a:destination)
	  call s:CommandCabbr(a:name, a:destination)
	endfunction

	function ChangeDirectory(dir, ...)
    
	let &cdpath = ',' . getcwd() 

	exe "bufdo! " . "cd " . (a:dir)

	let stay = exists("a:1") ? a:1 : 1	
     	  	  
	  NERDTree  

	  if !stay
	 	wincmd p 
	  endif

	wincmd l

    endfunction
	
	function Touch(file)
	  execute "!touch " . shellescape(a:file, 1)
	  call s:UpdateNERDTree()
	endfunction

	function Remove(file)
	  let current_path = expand("%")
	  let removed_path = fnamemodify(a:file, ":p")

	  if (current_path == removed_path) && (getbufvar("%", "&modified"))
		echo "You are trying to remove the file you are editing. Please close the buffer first."
	  else
		execute "!rm " . shellescape(a:file, 1)
	  endif

	  call s:UpdateNERDTree()
	endfunction

	function Mkdir(file)
	  execute "!mkdir " . shellescape(a:file, 1)
	  call s:UpdateNERDTree()
	endfunction

	function Edit(file)
	  if exists("b:NERDTreeRoot")
		wincmd p
	  endif

	  execute "e " . fnameescape(a:file)

	endfunction

	function s:UpdateNERDTree(...)
	  let stay = 0

	  if(exists("a:1"))
		let stay = a:1
	  end

	  if exists("t:NERDTreeBufName")
		let nr = bufwinnr(t:NERDTreeBufName)
		if nr != -1
		  exe nr . "wincmd w"
		  exe substitute(mapcheck("R"), "<CR>", "", "")
		  if !stay
			wincmd p
		  end
		endif
	  endif

	  if exists(":CommandTFlush") == 2
		CommandTFlush
	  endif
	endfunction
	

" Plug-in Configs & Inits

	let g:NERDTreeChDirMode=2
	let g:NERDTreeStatusline="%{getcwd()}"
	let g:SuperTabDefaultCompletionType="context"
	call s:DefineCommand("cd", "ChangeDirectory")
	call s:DefineCommand("touch", "Touch")
	call s:DefineCommand("rm", "Remove")
	call s:DefineCommand("e", "Edit")
	call s:DefineCommand("mkdir", "Mkdir")
	
" Auto Commands
	
	autocmd FileType html set omnifunc=htmlcomplete#Complete
	autocmd BufWinLeave *.* mkview!
	autocmd BufWinEnter *.* silent loadview
	autocmd Vimenter * NERDTree
	autocmd Vimenter * wincmd l
	autocmd WinEnter * call s:IfNoBuffers()
	autocmd FocusGained * call s:UpdateNERDTree() 
	
" Key Mappings

	nmap <F2> :NERDTreeToggle<CR>
	nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Commented Zone

	"Functions to Synch Vim Cmds to NerdTree
	"set statusline+=%{SyntaxItem()}
	"function! SyntaxItem()
	"	return synIDattr(synID(line("."),col("."),1),"name")
	"endfunction
