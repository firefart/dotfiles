syntax on
filetype plugin indent on

" colors
set t_Co=256                              " use 256 colors in terminal
color molokai

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" http://vimdoc.sourceforge.net/htmldoc/options.html
let mapleader=","                         " leader is comma
set visualbell                            " Use visual bell instead of beeping when doing something wrong
set laststatus=2                          " Always display the status line, even if only one window is displayed
set tabstop=2                             " number of visual spaces per TAB
set shiftwidth=2
set softtabstop=2                         " number of spaces in tab when editing
set expandtab                             " tabs are spaces
set mouse=a                               " Enable use of the mouse for all modes
set cursorline                            " highlight current line
set wildmenu                              " visual autocomplete for command menu
set showmatch                             " highlight matching [{()}]
set incsearch                             " search as characters are entered
set hlsearch                              " highlight matches
nnoremap <leader><space> :nohlsearch<CR>  " turn off search highlight, mapped to ,<space>
set scrolloff=5                           " number above and below the cursor when scrolling
set number                                " line numbers
set formatoptions=l                       " long lines are not reformatted in insert mode
set wildmenu                              " auto completion for vim commands
set wildmode=list:longest,full
set ruler                                 " show ruler (line and column)
set cursorline                            " Highlight the screen line of the cursor
set ttyfast                               " Indicates a fast terminal connection
set encoding=utf-8
set title                                 " show filename in title
set smartcase                             " Override the 'ignorecase' option if the search pattern contains upper case characters
set history=1000                          " longer history

inoremap jj <ESC>                         " when typing jj in insert mode, go back to normal mode
" jump to start and end
nnoremap <leader>end $
nnoremap <leader>st ^

" simple hex editing
:map <Leader>hon :%!xxd<CR>
:map <Leader>hoff :%!xxd -r<CR>

" fix intendation on whole file
:map <Leader>i mzgg=G`z

" remap some commands because i suck at releasing shift
:command WQ wq
:command Wq wq
:command W w
:command Q q

" nerdcommenter
let g:NERDSpaceDelims = 1                 " Add spaces after comment delimiters by default
let g:NERDCompactSexyComs = 1             " Use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left'           " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDCommentEmptyLines = 1           " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDTrimTrailingWhitespace = 1      " Enable trimming of trailing whitespace when uncommenting

" nerdtree
map <C-n> :NERDTreeTabsToggle<CR>

" CtrlP
let g:ctrlp_map = '<C-p>'
let g:ctrlp_cmd = 'CtrlP'

set listchars=nbsp:¬,eol:¶,tab:>-,extends:»,precedes:«,trail:•
set list

" make ctrl+v work
vmap <C-C> "+y

