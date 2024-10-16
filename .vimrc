" Modeline and Notes {
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
"}

" Environment {
	" Basics {
		set nocompatible 		" must be first line
	" }

	" Windows Compatible {
		" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
		" across (heterogeneous) systems easier. 
		if has('win32') || has('win64')
		  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
		endif
	" }

" } 
	
" General {
	"set background=dark         " Assume a dark background
	set term=builtin_ansi       " Make arrow and other keys work
	filetype plugin indent on  	" Automatically detect file types.
	"filetype plugin on  	" Automatically detect file types.
	syntax on 					" syntax highlighting
	set mouse=a					" automatically enable mouse usage
    set ttymouse=xterm
	"set autochdir 				" always switch to the current file directory.. 
	" not every vim is compiled with this, use the following line instead
	" If you use command-t plugin, it conflicts with this, comment it out.
     "autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif
	scriptencoding utf-8
	set autowrite                  " automatically write a file when leaving a modified buffer
  set nofixeol                   " don't try to fix end of line newlines
	set shortmess+=filmnrxoOtT     	" abbrev. of messages (avoids 'hit enter')
	"set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
	"set virtualedit=onemore 	   	" allow for cursor beyond last character
	set history=1000  				" Store a ton of history (default is 20)
	set nospell 		 	        	" spell checking off
	
	" Setting up the directories {
		"set backup 						" backups are nice ...
		set backupdir=$HOME/.vimbackup//  " but not when they clog .
		set directory=$HOME/.vimswap// 	" Same for swap files
		set viewdir=$HOME/.vimviews// 	" same for view files
		
		"" Creating directories if they don't exist
		silent execute '!mkdir -p $HOME/.vimbackup'
		silent execute '!mkdir -p $HOME/.vimswap'
		silent execute '!mkdir -p $HOME/.vimviews'
		
		" Causes bad exit value for some reason"
		"au BufWinLeave * silent! mkview  "make vim save view (state) (folds, cursor, etc)
		"au BufWinEnter * silent! loadview "make vim load view (state) (folds, cursor, etc)
	" }
" }

" Vim UI {
	"color desert     	       		" load a colorscheme
	set tabpagemax=15 				" only show 15 tabs
	set showmode                   	" display the current mode

	set nocursorline  				" highlight current line
	"hi cursorline guibg=#333333 	" highlight bg color of current line
	"hi CursorColumn guibg=#333333   " highlight cursor

	if has('cmdline_info')
		set ruler                  	" show the ruler
		set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
		set showcmd                	" show partial commands in status line and
									" selected characters/lines in visual mode
	endif

	if has('statusline')
		"set laststatus=1           	" show statusline only if there are > 1 windows
		" Use the commented line if fugitive isn't installed
		"set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
		set cmdheight=2
		set laststatus=2
		" set statusline=[%l,%c\ %P%M]\ %f\ %r%h%w
		set statusline=[%l,%c\][\%{&ff}]\%y\ %f\ %r%h%w 

	endif

	set backspace=indent,eol,start 	" backspace for dummys
	set linespace=0 				" No extra spaces between rows
	set nu 							" Line numbers on
	set showmatch                  	" show matching brackets/parenthesis
	set incsearch 					" find as you type search
	set hlsearch 					" highlight search terms
	set winminheight=0 				" windows can be 0 line high 
	set ignorecase 					" case insensitive search
	set smartcase 					" case sensitive when uc present
	set wildmenu 					" show list instead of just completing
	set wildmode=list:longest,full 	" comand <Tab> completion, list matches, then longest common part, then all.
	"set whichwrap=b,s,h,l,<,>,[,]	" backspace and cursor keys wrap to
	set scrolljump=5 				" lines to scroll when cursor leaves screen
	set scrolloff=3 				" minimum lines to keep above and below cursor
	"set foldenable  				" auto fold code
	"set gdefault					" the /g flag on :s substitutions by default

" }

" Formatting {
	"set nowrap                     	" wrap long lines
	set autoindent                 	" indent at the same level of the previous line
	set shiftwidth=2               	" use indents of 4 spaces
	"set noexpandtab 	       		" tabs are tabs, not spaces
	set expandtab 	       		" tabs are tabs, not spaces
	set tabstop=2 					" an indentation every four columns
	"set matchpairs+=<:>            	" match, to be used with % 
	set pastetoggle=<F3>          	" pastetoggle (sane indentation on pastes)
	"set comments=sl:/*,mb:*,elx:*/  " auto format comment blocks
" }

" Key Mappings {

	" Easier moving in tabs and windows
	map <C-J> <C-W>j<C-W>_
	map <C-K> <C-W>k<C-W>_
	map <C-L> <C-W>l<C-W>_
	map <C-H> <C-W>h<C-W>_
	map <C-K> <C-W>k<C-W>_
	" The following two lines conflict with moving to top and bottom of the
	" screen
	" If you prefer that functionality, comment them out.
	map <S-H> gT          
	map <S-L> gt

	" Stupid shift key fixes
	"cmap W w 						
	"cmap WQ wq
	"cmap wQ wq
	"cmap Q q
	"cmap Tabe tabe

	" Yank from the cursor to the end of the line, to be consistent with C and D.
	nnoremap Y y$

	" Shortcuts
	" Change Working Directory to that of the current file
    cmap cwd lcd %:p:h

	" For when you forget to sudo.. Really Write the file.
	cmap w!! w !sudo tee % >/dev/null
" }

" Plugins {

	" PIV {
		let g:DisableAutoPHPFolding = 0
	" }
	
	" Supertab {
		"let g:SuperTabDefaultCompletionType = "context"
		let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
	" }

	" Misc { 
		let g:checksyntax_auto = 0

		let b:match_ignorecase = 1
	" }	
	
	" NERDTRee {
		"comment out line(s) in visual mode
		vmap  o  :call NERDComment(1, 'toggle')<CR>
		let g:NERDShutUp=1

		cnoreabbr nt NERDTree 
	" }

  
		" some convenient mappings 
		inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
		inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
		inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
		inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
		inoremap <expr> <C-d> 	   pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
		inoremap <expr> <C-u>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

		" automatically open and close the popup menu / preview window
		au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
		set completeopt=menu,longest,preview
	" }
	
	" Ctags {
		set tags=./tags;/,~/.vimtags
	" }

	" Vim-Picker {
      try 
	      source ~/.vim/pack/plugins/vim-picker.vim
      catch
	      echo v:exception
      endtry 
	"}

" }

" GUI Settings {
	" GVIM- (here instead of .gvimrc)
  set clipboard=unnamed
	if has('gui_running')
		colorscheme argonaut
		"set guifont=Monaco:h10.00
    set guifont=Consolas:h14
    "set transparency=5
   
		set gcr=a:blinkon0
		set guioptions-=T          	" remove the toolbar
		set lines=40               	" 40 lines of text instead of 24,
		set vb
	else
		colorscheme default
    set visualbell 
	endif
" }
"
