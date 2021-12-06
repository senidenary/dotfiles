" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Enable line numbers
set number

" A buffer becomes hidden when it is abandoned
set hid

" Show command auto-completions
set wildmenu

" Display partially entered commands
set showcmd

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Enable syntax highlighting
syntax enable
colorscheme desert

" Use spaces instead of tabs, except in makefiles
" set expandtab
" autocmd FileType make setlocal noexpandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Show whitespace
set listchars=eol:¬,tab:>·,trail:~
set list

" Up/Down keys move graphically
noremap  <buffer> <silent> <Up>        gk
inoremap <buffer> <silent> <Up>   <C-o>gk
noremap  <buffer> <silent> <Down>      gj
inoremap <buffer> <silent> <Down> <C-o>gj

