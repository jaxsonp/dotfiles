" Jaxson's vimrc


if &compatible
  set nocompatible
endif

" Visual stuff ------------------------------------------------

" theme
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

set number " Display line numbers
set ruler " Display the cursor position in the status line of a window

" Enable syntax highlighting
if has('syntax')
  syntax on
endif

colorscheme onedark

set hlsearch " Highlight searches

set display=truncate " Show @@@ in the last line if it is truncated.

set shiftwidth=4
set softtabstop=4

" attempt to use auto-indenting based on filetype
if has('filetype')
  filetype indent plugin on
endif

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

" map Y y$ " Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy, which is the default
