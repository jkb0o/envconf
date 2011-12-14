set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЭХЪ;ABCDEFGHIJKLMNOPQRSTUVWXYZ\"{},фисвуапршолдьтщзйкыегмцчняхъ;abcdefghijklmnopqrstuvwxyz[]

" colors
au VimEnter *
   \ if &term == 'xterm-color' || &term=='screen-bce'    |
   \       set t_Co=256            |
   \ endif

let xterm16bg_Normal = 'none'
let xterm16_colormap    = 'soft'
let xterm16_brightness  = 'med'
colorscheme xterm16


" mouse
set ttymouse=xterm2
set mouse=a
vmap c "+y
vmap с "+y

" folding
set foldmethod=indent
set nocp
set incsearch
set nu
set encoding=utf-8
set termencoding=utf-8
set ruler
set showcmd
set nohlsearch
set scrolljump=7
set scrolloff=7
set novisualbell
set ch=1
set mousehide
set autoindent
set nowrap
syn on
set backspace=indent,eol,start whichwrap+=<,>,[,]
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set statusline=%<%f%h%m%r\ %b\ %{&encoding}\ 0x\ \ %l,%c%V\ %P
set laststatus=2
set smartindent
set fo+=cr
"set sessionoptions=curdir,buffers,tabpages
set shortmess+=A
set autoread
set updatetime=500

"let ropevim_vim_completion=1
"let ropevim_extended_complete=1
"let ropevim_enable_shortcuts=1


" Template Toolkit
au BufNewFile,BufRead *.tt setf tt2html

"imap <Tab> <C-R>=TabWrapperRope()<CR>

filetype plugin on

imap <c-l> <c-x><c-o>
set complete=""
set complete+=. 
set complete+=k 
set complete+=b 
set complete+=t 
set completeopt+=preview 
set completeopt+=longest
set completeopt+=menuone

noremap <C-B> <esc>:call ToggleBuffExplorer()<cr>
"imap <C-l> <C-r>=RopeCodeAssistInsertMode()<CR>
