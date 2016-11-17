filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'scrooloose/syntastic'
Bundle 'davidhalter/jedi-vim'
Bundle 'kien/ctrlp.vim'
Bundle 'mattn/gist-vim'
Bundle 'motemen/git-vim'
Bundle 'jmcantrell/vim-virtualenv'
Bundle 'nosami/Omnisharp'
Bundle 'tpope/vim-dispatch'
Bundle 'altercation/vim-colors-solarized'
Bundle 'ervandew/supertab'
Bundle 'Chiel92/vim-autoformat'
Bundle 'jlanzarotta/bufexplorer'
Bundle 'amiorin/vim-project'
Bundle 'Valloric/YouCompleteMe'
Bundle 'rdnetto/YCM-Generator'
Bundle 'SirVer/ultisnips'

filetype plugin indent on

if has("gui_running")
    :colorscheme solarized
    :set background=light
else
    :set t_Co=256
    :let xterm16bg_Normal = 'none'
    :let xterm16_colormap    = 'soft'
    :let xterm16_brightness  = 'med'
    :colorscheme xterm16
endif




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

" indent
set autoindent
set expandtab
set shiftwidth=4   " Make 'shiftwidth' follow 'tabstop'
au BufEnter * set tabstop=4
au BufEnter * set shiftwidth=4
au BufEnter *.yaml,*.css,*.js,*.html set tabstop=2
au BufEnter *.yaml,*.css,*.js,*.html set shiftwidth=2

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
set nowrap
syn on
set backspace=indent,eol,start whichwrap+=<,>,[,]
"set statusline=%{GitBranchInfoString()}
"set statusline=%<%f%h%m%r%#ErrorMsg#%{VirtualEnvStatusline()}-%{GitBranchInfoString()}%#StatusLine#\ %b\ %{&encoding}\ 0x\ \ %l,%c%V\ %P
set laststatus=2
set smartindent
set fo+=cr
"set sessionoptions=curdir,buffers,tabpages
set shortmess+=A
set autoread
set updatetime=500
set completeopt=longest,menuone
set ignorecase
set smartcase

" TODO: create per-project ignore
set wildignore+=*.so,*.swp,*.zip,*.pyc
set wildignore+=*.meta
set wildignore+=*.dll
set wildignore+=*.dylib
set wildignore+=*WonderWay/Library*
set wildignore+=*WonderWay/Temp*
set wildignore+=*WonderWay/ios*
let mapleader = ","


" Template Toolkit
au BufNewFile,BufRead *.tt setf tt2html

filetype plugin on

noremap <c-b> <esc>:BufExplorer<cr>

" insert and paste in all modes using system clipboard
" make sure u have vim-gnome package
map <F4> "+y
map <F5> "+P
imap <F5> <ESC>"+pa


" Buffers - explore/next/previous: Alt-F12, F12, Shift-F12.
nnoremap <silent> <M-F12> :BufExplorer<CR>
nnoremap <silent> <F12> :bn<CR>
nnoremap <silent> <S-F12> :bp<CR>

"jedi config
let g:jedi#goto_command = "<cr>"
let g:jedi#autocompletion_command = "<C-l>"
let g:jedi#popup_on_dot = 0
"let g:jedi#use_tabs_not_buffers = 0


" omnisharp
"set omnifunc=OmniSharp#Complete
autocmd FileType cs set omnifunc=OmniSharp#Complete
au BufEnter *.cs nnoremap <buffer> <cr> :OmniSharpGotoDefinition<cr>
au BufEnter *.cs nnoremap <Buffer> <leader>nm :OmniSharpRename<cr>
au BufEnter *.cs nnoremap <buffer> <leader>fu :OmniSharpFindUsages<cr>
au FileType cs call SuperTabSetDefaultCompletionType("<c-x><c-o>")
au FileType python call SuperTabSetDefaultCompletionType("<c-x><c-o>")

" supertab
let g:SuperTabLongestEnhanced = 1
let g:SuperTabLongestHighlight = 1

" autoformat
let g:formatprg_cs = "astyle"
let g:formatprg_args_cs = "--mode=cs --style=1tbs -pJcHs4N -M40 --close-templates --max-code-length=100 --break-blocks --delete-empty-lines"
map <F3> :Autoformat<cr>:v/\_s*\S/d<cr><c-o>


" bufexplorer
let g:bufExplorerShowRelativePath=1
let g:bufExplorerSortBy='mru'


" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_by_filename = 1
let g:ctrlp_extensions = ['buffertag', 'tag', 'line', 'dir']

map <c-f> :CtrlPLine<cr>




let s:current_project = ""
function! OpenCSharpProject(title) abort
  if a:title != s:current_project
    call OmniSharp#StopServer()
    call OmniSharp#StartServer()
    let s:current_project = a:title
  endif
endfunction
