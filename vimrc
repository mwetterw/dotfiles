" Summary -------------------------------------------------------- {{{
"
" Sections:
" - Preamble
" - Vim user interface
" - Syntax related
" - Status line
" - Text, tab and indent related
" - Colors and Fonts
" - Moving around, tabs and buffers
" - Searching
" - Various key remaps
" - Helper functions
" - Filetype settings
" - Plugin customization
"
" ---------------------------------------------------------------- }}}

" Preamble ------------------------------------------------------- {{{

" Sets how many lines of history Vim has to remember
set history=700

set nocompatible

" Set to auto read when a file is changed from the outside
set autoread

" Vim startup message
set shortmess+=I

" Set mapleader (shortcut key) to ","
let mapleader = ","
let g:mapleader = ","

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Turn backup off, since most stuff is in svn / git anyway...
set nobackup
set nowb
set noswapfile

" Enable filetype plugins
filetype plugin indent on

" Load plugins
if filereadable(expand("~/.vim/plugins.vim"))
    source ~/.vim/plugins.vim
endif
" ---------------------------------------------------------------- }}}

" Vim user interface --------------------------------------------- {{{

" Compatible options
set cpoptions+=$

" Title is name of current file
set title

" Set 5 lines to the cursor - when moving vertically using j / k
set scrolloff=5

" Turn on the WiLd menu
set wildmenu

" Enhanced completion (shell like first, then wildmenu)
set wildmode=longest:full

" Ignore compiled files and backups
set wildignore=*.o,*~,*.pyc,*.gch

" Show line numbers
set number

" Show cmd
set showcmd

" Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" No annoying sound on errors
set noerrorbells
set visualbell
set t_vb=
set timeoutlen=500

" Hide the mouse pointer while typing
set mousehide

" Deactivate mouse entirely
set mouse=

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Enable highlighting of current column & line
set cursorline
set cursorcolumn

" ---------------------------------------------------------------- }}}

" Syntax related ------------------------------------------------- {{{

" Enable syntax highlighting
syntax enable

" Show matching brackets when text indicator is over them
set showmatch

" Fold settings
set foldmethod=indent

" Max number of fold levels
set foldnestmax=10

" Folding everything
set nofoldenable

" Again, folding parent levels
set foldlevel=1

" How many tenths of a second to blink when matching brackets
set matchtime=20

" For regular expressions turn magic on
set magic

let g:syntastic_check_on_wq=0
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_go_checkers = ['go', 'gofmt', 'golint' , 'govet']

let g:syntastic_cpp_compiler = 'g++'
let g:syntastic_cpp_compiler_options = ' -std=c++11'

let g:go_fmt_command = "goimports"
let g:go_play_open_browser = 0
let g:go_fmt_fail_silently = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_doc_command = "godoc"


" Default completing function
set omnifunc=syntaxcomplete#Complete

" ---------------------------------------------------------------- }}}

" Status line ---------------------------------------------------- {{{

" Always put a status line in, even if there is only one window
set laststatus=2

" Status line stolen from Derek Wyatt's configuration:
" - found here : "https://github.com/derekwyatt/vim-config/blob/master/vimrc"
"set statusline=%f\ %m\ %r%{fugitive#statusline()}\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n\ [%b][0x%B]

" Status line stolen from Top Vimbits
" - found here : "http://vimbits.com/bits/95"
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" ---------------------------------------------------------------- }}}

" Text, tab and indent related ----------------------------------- {{{

" Force use of spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" Tabs are displayed like 4 spaces
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Invisible characters
set nolist
set listchars=tab:▸-,eol:¬,trail:⋅,extends:❯,precedes:❮,nbsp:⇼
set showbreak=↪

" Virtual edit (awesome)
set virtualedit=all

" Explicit FTW
set autoindent
set smartindent
set wrap

" ---------------------------------------------------------------- }}}

" Searching ------------------------------------------------------ {{{

" Ignore case
set ignorecase

" Try to be smart about cases
set smartcase

" Highlight results
set hlsearch

" Makes search act like in modern browsers
set incsearch

" ---------------------------------------------------------------- }}}

" Colors and Fonts ----------------------------------------------- {{{


" Editing font
set guifont=Droid\ Sans\ Mono\ 11

" Colorscheme
set background=dark
colorscheme molokai

" Set extra options when running in GUI mode
if has("gui_running")
    set go-=r
    set go-=R
    set go-=l
    set go-=L
    set go-=m
    set go-=T
    set go+=e
    set t_Co=256
    set gtl=%M\ %t
endif

" Spelling
set spelllang=fr,en,de

hi clear SpellBad
hi SpellBad cterm=italic,bold,underline ctermfg=208
hi SpellBad guifg=#B58900 gui=undercurl guisp=#D63034

hi clear SpellCap
hi SpellCap cterm=italic ctermfg=208
hi SpellCap gui=undercurl guisp=#B58900

hi clear SpellRare
hi SpellRare ctermfg=200
hi SpellRare guifg=#409207



" Color of icons side bar
hi clear SignColumn
hi SignColumn guibg=#002B36

" Color for highlight of errors and warnings (errormarkers)
hi EM_Warning term=bold ctermbg=5 gui=bold guifg=#B58900 guibg=#073642
hi EM_Error cterm=bold ctermfg=160 ctermbg=52 gui=bold guifg=#C43B3B guibg=#660000
let g:errormarker_warninggroup = "EM_Warning"
let g:errormarker_errorgroup = "EM_Error"
let &errorformat="%f:%l: %t%*[^:]:%m," . &errorformat
let &errorformat="%f:%l:%c: %t%*[^:]:%m," . &errorformat
let g:errormarker_warningtypes = "wW"


" Color for special characters (set list)
hi SpecialKey ctermbg=red guibg=red
" ---------------------------------------------------------------- }}}

" Moving around, tabs, windows and buffers ----------------------- {{{

" A buffer becomes hidden when it is abandoned
set hidden

" Specify the behavior when switching between buffers
set switchbuf=useopen,usetab,newtab

" Tab display
set showtabline=0

" Split towards the right
set splitright

if has("autocmd")
    " Return to last edit position when opening files
    autocmd BufReadPost *
                \ if !exists("b:nolasteditpos")
                        \ && line("'\"") > 0
                        \ && line("'\"") <= line("$") |
                    \ exe "normal! g`\"" |
                \ endif

    " Cd directory when opening files
    "autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

    " Auto open NERDTree if no args given
    autocmd vimenter * if !argc() | NERDTree | endif

    " Corrects C++ comments syntax
    autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s
endif

set completeopt=menu,menuone

" NERDTree options
let NERDChristmasTree=1
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeWinSize=45
let NERDTreeDirArrows=1
let NERDTreeShowLineNumbers=1
let NERDTreeChDirMode=2

" ---------------------------------------------------------------- }}}

" Various key remaps --------------------------------------------- {{{

" Allow to keep Q down to kill all vim instances when invoked by git
map Q :qa<Enter>

" Toogle line numbers display
noremap <silent> <F6> :set number!<cr>

" Toogle NERDTree
" nnoremap <silent> <leader>n :NERDTreeToggle<CR>
nnoremap <silent> <leader>n :NERDTreeMirrorToggle<CR>

" Treat long lines as break lines (useful when moving around in them)
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" Resolve inconsistency between "Y" (line),
" and "D" (til end of line)
"nmap D dd
nmap Y y$

" Visual block indenting: keep selection after indenting
vmap > >gv
vmap < <gv

" Disable arrow keys (forever...)
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" Fast saving
nnoremap <silent> <leader>w :w<cr>

" Close current file
nmap <silent> <leader>q :q<cr>

" Fast fugitive
nnoremap <silent> <leader>gst :Gst<cr>
nnoremap <silent> <leader>gcc :Gcommit<cr>
nnoremap <silent> <leader>gco :Gread<cr>
nnoremap <silent> <leader>ga :Gwrite<cr>
nnoremap <silent> <leader>gl :Git! log<cr>
nnoremap <silent> <leader>gb :Gblame<cr>
nnoremap <silent> <leader>gd :Gdiff<cr>
nnoremap <silent> <leader>gdd :Gsdiff :1 \| Gvdiff<cr>
nnoremap <silent> <leader>gdo :diffoff \| only<cr>

" Fast FSwitch
nmap <silent> <Leader>of :FSHere<cr>
nmap <silent> <Leader>ol :FSRight<cr>
nmap <silent> <Leader>oL :FSSplitRight<cr>
nmap <silent> <Leader>oh :FSLeft<cr>
nmap <silent> <Leader>oH :FSSplitLeft<cr>
nmap <silent> <Leader>ok :FSAbove<cr>
nmap <silent> <Leader>oK :FSSplitAbove<cr>
nmap <silent> <Leader>oj :FSBelow<cr>
nmap <silent> <Leader>oJ :FSSplitBelow<cr>

" Spelling check toggle
noremap <silent> <F7> :set spell!<cr>

" Compiling options and cwin navigation
nnoremap <silent> <Leader>cw :botright cope<cr><C-w>p
nnoremap <silent> <Leader>cq :cclose<cr>

nnoremap <silent> <Leader>m :make<cr><cr>:botright cope<cr><C-w>p:cwin<cr>
nnoremap <silent> <Leader>cn :cn<cr>
nnoremap <silent> <Leader>cp :cp<cr>
nnoremap <silent> <Leader>cf :cr<cr>
nnoremap <silent> <Leader>cl :cla<cr>
"nnoremap <silent> <Leader>cc :cc<cr> "This is done by errormarker plugin
" ---------------------------------------------------------------- }}}
