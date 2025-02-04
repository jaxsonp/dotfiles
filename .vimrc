" Jaxson's vimrc

set nocompatible

" Visual stuff ----------------------------------------------------------

set relativenumber
set cursorline " highlight line cursor is on

" Enable syntax highlighting
if has('syntax')
  syntax on
endif

if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif

let g:sonokai_disable_italic_comment=1
let g:sonokai_better_performance=1
colorscheme sonokai

set hlsearch " Highlight searches

set display=truncate " Show @@@ in the last line if it is truncated.

" tab stuff
set shiftwidth=4
set tabstop=4
set softtabstop=4

set list " show whitespace
set listchars=tab:\|\ ,trail:·,extends:>,precedes:<

" attempt to use auto-indenting based on filetype
if has('filetype')
	filetype indent plugin on
endif

" Plugins ---------------------------------------------------------------

call plug#begin()

" Fancy status line
Plug 'vim-airline/vim-airline'
let g:airline_theme='sonokai' " setting status line colortheme

" syntax highlighting
Plug 'sheerun/vim-polyglot'

" highlight yanked text
Plug 'machakann/vim-highlightedyank'

call plug#end()


" editor behavior stuff ----------------------------------------------

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

set backspace=indent,eol,start " Allow backspacing over everything in insert mode.

set autoindent
set nostartofline

" Always display the status line, even if only one window is displayed
set laststatus=2

set confirm " Ask before saving w/o quitting

set visualbell " Use visual bell instead of beeping when doing something wrong

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
if has('mouse')
	set mouse=a
endif

" Set the command window height to 2 lines
set cmdheight=2

" Show a few lines of context around the cursor
set scrolloff=5

" boring stuff ----------------------------------------------

set hidden

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use f3 to toggle between 'paste' and 'nopaste'
set pastetoggle=<F3>


" Mappings --------------------------------------------------

" map Y y$ " Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy, which is the default
