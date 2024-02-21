" Jaxson's vimrc


if &compatible
  set nocompatible
endif

" Visual stuff ------------------------------------------------

" theme
if (has("termguicolors"))
 set termguicolors
endif
colorscheme sonokai

" Display line numbers
set number

" Display the cursor position in the status line of a window
set ruler

" Enable syntax highlighting
if has('syntax')
  syntax on
endif

" Highlight searches
set hlsearch

" Show @@@ in the last line if it is truncated.
set display=truncate



" Indentation stuff ------------------------------------------

" Indentation settings for using 2 spaces instead of tabs.
set shiftwidth=4
set softtabstop=4

" attempt to use auto-indenting based on filetype
if has('filetype')
  filetype indent plugin on
endif


" Practical stuff ------------------------------------------------

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

set autoindent
set nostartofline

" Always display the status line, even if only one window is displayed
set laststatus=2

" Ask before saving w/o quitting
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

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

" Don't wake up system with blinking cursor:
let &guicursor = &guicursor . ",a:blinkon0"

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

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>


" Mappings --------------------------------------------------

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy, which is the default
map Y y$
