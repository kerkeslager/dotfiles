" Don't imitate vi.
set nocompatible

" Make tab-completion work more like bash.
set wildmenu
set wildmode=list:full

" Ignore certain file extensions when tab-completing.
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,*.exe

" Set filetype stuff to on.
filetype on
filetype plugin on

" Set up autoindentation.
set smartindent
filetype indent on

" Example filetype-specific setting:
" if has('autocmd')
"     autocmd filetype python set expandtab
" endif

" Allow folding.
set foldenable
set foldmethod=syntax
set foldlevelstart=99

" Scroll five lines ahead of cursor.
set scrolloff=5

" Turn off error bells and visual bell
set noeb vb t_vb=

" Set tabs to width 2.
filetype plugin indent on
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" language-specific settings: tab width is 4 for python
autocmd FileType python setlocal shiftwidth=4 softtabstop=4 tabstop=4

"allow projet-specific vimrcs
set exrc
set secure " Don't execute :autocmd in project-specific vimrcs unless owned by me

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

"Highlight bad spacing.
highlight BadSpacing term=standout ctermbg=cyan
augroup Spacing
    autocmd!
    " Highlight tabulators and trailing spaces
    autocmd BufNewFile,BufReadPre * match BadSpacing /\(\t\|  *$\)/
    " Only highlight trailing space in tab-filled formats
    autocmd FileType help,make match BadSpacing /  *$/
augroup END

" Search as you type.
set incsearch

" Display command and location status.
set ruler
set showcmd

" Multiple windows are equally sized and open in reading order.
set equalalways
set splitbelow splitright

" Line wrapping off
set nowrap

" Enlarge history and undo/redo buffers.
set history=1000
set undolevels=1000

" Reset colors to a clean state.
if !has('gui_running')
    set t_Co=8 t_md=
endif

" Enable syntax highlighting.
syntax enable

" Force vim to sync syntax highlighting from the beginning of the file.
syn sync fromstart

" Set the color scheme to desert.
colorscheme desert

" Set custom whitespace display
set list
set showbreak=↪\ 
set listchars=tab:\ \ →,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨

" Unmap the arrow keys to prevent bad habits.
noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>

" Automatically reload the .vimrc when changes are made to it
au! BufWritePost .vimrc source %
