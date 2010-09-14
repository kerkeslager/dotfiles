" Don't imitate vi.
set nocompatible

" Ignore certain file extensions when tab-completing.
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o

" set filetype stuff to on
filetype on
filetype plugin on
filetype indent on

" Example filetype-specific setting:
" if has('autocmd')
"     autocmd filetype python set expandtab
" endif

" Show line numbers.
set number
set numberwidth=4

" Scroll five lines ahead of cursor.
set scrolloff=5

" Set up autoindentation.
set smartindent
filetype indent on

" Set tabs to width 4.
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

"Highlight bad spacing
highlight BadSpacing term=standout ctermbg=cyan
augroup Spacing
    autocmd!
    " Highlight tabulators and trailing spaces
    autocmd BufNewFile,BufReadPre * match BadSpacing /\(\t\|  *$\)/
    " Only highlight trailing space in tab-filled formats
    autocmd FileType help,make match BadSpacing /  *$/
augroup END

" Highlight search terms.
set hlsearch

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

" Enlarge history and undo/redo buffers
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

" Unmap the arrow keys to prevent bad habits.
noremap  <Up> ""
noremap! <Up> <Esc>
noremap  <Down> ""
noremap! <Down> <Esc>
noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>


