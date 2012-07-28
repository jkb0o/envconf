set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЭХЪ;ABCDEFGHIJKLMNOPQRSTUVWXYZ\"{},фисвуапршолдьтщзйкыегмцчняхъ;abcdefghijklmnopqrstuvwxyz[]

" colors
au VimEnter *
   \ if &term == 'xterm-color' || &term=='screen-bce' || &term=='xterm' || &term=='screen.linux'  |
   \       set t_Co=256            |
   \ endif

let xterm16bg_Normal = 'none'
let xterm16_colormap    = 'soft'
let xterm16_brightness  = 'med'
colorscheme xterm16

" vim_git preferences
let g:git_branch_status_head_current=1
let g:git_branch_status_text=""
let g:git_branch_status_nogit="-"

" vim gist preverences
let g:gist_clip_command = 'xclip -selection clipboard'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_browser_command = 'chromium-browser %URL%'

" virtualenv
let g:virtualenv_directory = '~/env'
let g:virtualenv_stl_format = '[%n]'

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
set statusline=%{GitBranchInfoString()}
set statusline=%<%f%h%m%r%#ErrorMsg#%{VirtualEnvStatusline()}-%{GitBranchInfoString()}%#StatusLine#\ %b\ %{&encoding}\ 0x\ \ %l,%c%V\ %P
set laststatus=2
set smartindent
set fo+=cr
"set sessionoptions=curdir,buffers,tabpages
set shortmess+=A
set autoread
set updatetime=500
set completeopt=longest,menuone
set wildmenu
"let ropevim_vim_completion=1
"let ropevim_extended_complete=1
"let ropevim_enable_shortcuts=1


" Template Toolkit
au BufNewFile,BufRead *.tt setf tt2html

"imap <Tab> <C-R>=TabWrapperRope()<CR>

filetype plugin on

" Rope settings
let ropevim_vim_completion=1
let ropevim_extended_complete=1
let ropevim_enable_shortcuts=1
noremap <c-b> <esc>:BufExplorer<cr>
imap <C-l> <C-r>=RopeCodeAssistInsertMode()<CR>
au BufEnter * silent! unmap <cr>
au BufEnter *.py map <silent> <cr> :RopeGotoDefinition<cr>

" insert and paste in all modes using system clipboard
" make sure u have vim-gnome package
map <F4> "+y
map <F5> "+P
imap <F5> <ESC>"+pa


" Buffers - explore/next/previous: Alt-F12, F12, Shift-F12.
nnoremap <silent> <M-F12> :BufExplorer<CR>
nnoremap <silent> <F12> :bn<CR>
nnoremap <silent> <S-F12> :bp<CR>
