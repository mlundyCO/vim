filetype plugin indent on
syntax on           " Syntax Highlighting
set showcmd		    " Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set tabstop=4       " Tab makes 4 spaces
set shiftwidth=4    " Default indent 4 spaces
set expandtab       " Converts tabs to spaces
set nu              " Show line numbers
set autoindent      " Retains indentation of previous line
set wildmenu        " Command line completion

" Typing jk quickly returns to normal mode
imap jk <Esc>

" Double Esc saves file
map <Esc><Esc> :w<Cr>

" Highlights current line
set cursorline
highlight CursorLine cterm=NONE ctermbg=darkgray
