set encoding=utf-8
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" VCS
Plugin 'tpope/vim-fugitive'

" System
Plugin 'rking/ag.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-surround'
Plugin 'Raimondi/delimitMate'
Plugin 'luochen1990/rainbow'
Plugin 'kien/ctrlp.vim'
Plugin 'mhinz/vim-signify'
" Plugin 'scrooloose/nerdtree'
" Plugin 'w0rp/ale'

" Syntaxes
Plugin 'leshill/vim-json'
Plugin 'othree/html5.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'posva/vim-vue'

" Syntax Helper
Plugin 'mattn/emmet-vim'

" Testing PLugins
Plugin 'easymotion/vim-easymotion'
Plugin 'mileszs/ack.vim'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'jonathanfilip/vim-lucius'
" Track the engine.
" Plugin 'SirVer/ultisnips'
" Plugin 'honza/vim-snippets'

" TYPO3 related
Plugin 'elmar-hinz/vim.typoscript'
Plugin 'mipmip/vim-fluid'

" Vim plugin that displays tags in a window, ordered by scope
Plugin 'majutsushi/tagbar'

" NERDtree replacement, lightweigth - based on
Plugin 'tpope/vim-vinegar' 

" ghetto HTML/XML mappings (formerly allml.vim)
Plugin 'tpope/vim-ragtag'

" light statusline
Plugin 'itchyny/lightline.vim'
" Plugin 'craigemery/vim-autotag'
Plugin 'sjl/badwolf'

Plugin 'andreypopp/vim-colors-plain'

" Required after vundle plugin definitions
call vundle#end()
filetype plugin indent on

" Change leader
let mapleader = ","
let g:mapleader = ","

" Wildmenu
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.pyc                            " Python byte code
set wildignore+=**.class                          " Cursed Java class files

" Ignore in buffer explorer
let g:netrw_liststyle= 1 " Tree-mode
let g:netrw_list_hide= '.*\.swp$,.*/$'


" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" Basics
syntax enable
set relativenumber
set number        " always show line numbers
set hidden        " Allow un-saved buffers in background
set clipboard=unnamed " Share system clipboard.
set backspace=indent,eol,start " Make backspace behave normally.
set directory=/tmp// " swap files
set backupskip=/tmp/*,/private/tmp/*
set ffs=unix,dos,mac "Default file types
set nowrap        " don't wrap lines
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                   " case-sensitive otherwise
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

" Remove the toolbar if we're running under a GUI (e.g. MacVIM).
if has("gui_running")
  set guioptions=-t
  " Save when losing focus
  " set autowriteall " Auto-save files when switching buffers or leaving vim.
  " au FocusLost * silent! :wa
  " au TabLeave * silent! :wa
  " increase font size in MacVIM
  set guifont=Menlo\ Regular:h12
  " check one time after 4s of inactivity in normal mode
  set autoread
  au CursorHold * checktime
endif

" Default background & theme
set background=dark
colorscheme plain
" colorscheme lucius

" Special characters for hilighting non-priting spaces/tabs/etc.
set list listchars=tab:»\ ,trail:·

" Default Tabs & spaces
set tabstop=2     " a tab is four spaces
set shiftwidth=2  " number of spaces to use for autoindenting
set softtabstop=2
set expandtab
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting

set expandtab
" General Code Folding
set foldenable
set foldmethod=indent
set foldlevelstart=99
set foldlevel=99

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" General auto-commands
autocmd FileType * setlocal colorcolumn=0

" Markdown configurations
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" Ruby Configurations
autocmd filetype ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 shiftwidth=2 colorcolumn=80

" PHP Configurations
autocmd FileType php setlocal colorcolumn=100 tabstop=4 softtabstop=4 shiftwidth=4

" HTML configurations
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2 noexpandtab

" Javascript configurations
au BufNewFile,BufReadPost *.js setlocal shiftwidth=2 expandtab

" Ensure that JSON files have their filetype properly set.
au BufRead,BufNewFile *.json set filetype=json

" Fix those pesky situations where you edit & need sudo to save
cmap w!! w !sudo tee % >/dev/null

" Set blade templates to html file type
au BufNewFile,BufRead *.blade.php set filetype=html


" Plugin Configurations
"""""""""""""""""""""""
" crtl-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'  " search anything (in files, buffers and MRU files at the same time.)
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard']
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_root_markers = ['.git']
"let g:ctrlp_working_path_mode = 'ra' " search for nearest ancestor like .git, .hg, and the directory of the current file
let g:ctrlp_match_window_bottom = 0 " show the match window at the top of the screen
let g:ctrlp_max_height = 10 " maxiumum height of match window
let g:ctrlp_switch_buffer = 'et' " jump to a file if it's open already
let g:ctrlp_use_caching = 1 " enable caching
let g:ctrlp_clear_cache_on_exit=0 " speed up by not removing clearing cache evertime
let g:ctrlp_show_hidden = 0 " don't show me dotfiles
let g:ctrlp_mruf_max = 250 " number of recently opened files
nmap <leader>e :CtrlPBuffer<CR>
nmap <leader>f :CtrlP<CR>

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  "   " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects
  let g:ctrlp_user_command = ['.git', 'ag %s -l --nocolor -g ""']
endif

" Double rainbow - What does it mean!?
let g:rainbow_active = 1

set laststatus=2
let g:syntastic_enable_signs = 1
let g:syntastic_auto_jump = 0
let g:syntastic_puppet_lint_disable = 0

" NerdTree
" map <leader>n :NERDTreeToggle<CR>
" let NERDTreeIgnore=['\.pyc$', '\~$']
" let g:nerdtree_tabs_open_on_gui_startup = 0
" let g:nerdtree_tabs_open_on_console_startup = 0


" Buffer Remaps
map <silent> <leader>w :bd<cr>:tabclose<cr>gT
map <leader>w! :bd!<CR>

map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" ALE
:map <leader>l :ALEToggle<CR>
let g:ale_lint_on_enter = 0

" clear search highlighting
nnoremap <silent> <leader-c> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><leader-c>

""" Testing

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" let g:UltiSnipsSnippetDirectories=["~/.vim/og-snippets"]

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Ack
" Use ag if available
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
cnoreabbrev Ack Ack!
nnoremap <leader>F :Ack!<Space>

" Tagbar
nmap <leader>r :TagbarOpenAutoClose<cr>
nmap <leader>r! :TagbarToggle<cr>

" silent switch to current file directory
autocmd BufEnter * silent! lcd %:p:h
