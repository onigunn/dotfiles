call plug#begin('~/.local/share/nvim/plugged')
Plug 'rking/ag.vim'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-surround'
Plug 'ludovicchabant/vim-gutentags'
Plug 'SirVer/ultisnips'
" Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" intellisense stuff
Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'}
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'phpactor/ncm2-phpactor'

call plug#end()

set encoding=utf-8
set nocompatible

syntax enable
set relativenumber
set number        
set hidden        
set clipboard=unnamed 
set backspace=indent,eol,start 
set directory=/tmp// 
set backupskip=/tmp/*,/private/tmp/*
set ffs=unix,dos,mac 
set nowrap        
set showmatch     
set ignorecase    
set smartcase     
set hlsearch      
set incsearch     
set history=1000        
set undolevels=1000      
set title                
set visualbell           
set noerrorbells         

" change leader
let mapleader = ","
let g:mapleader = ","

set list listchars=tab:»\ ,trail:·"

" Default Tabs & spaces
set tabstop=2     " a tab is four spaces
set shiftwidth=2  " number of spaces to use for autoindenting
set softtabstop=2
set expandtab
set shiftround    " use multiple of shiftwidth when indenting with '<' and" '>'
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set expandtab
set foldenable
set foldmethod=indent
set foldlevelstart=99
set foldlevel=99

" look
set background=dark

" autocmds 

" ncm2 related
au BufEnter * call ncm2#enable_for_buffer()
" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect

au FileType * setlocal colorcolumn=0
au FileType php setlocal colorcolumn=100 tabstop=4 softtabstop=4 shiftwidth=4
au FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2 noexpandtab
au BufNewFile,BufReadPost *.js setlocal shiftwidth=2 expandtab
au BufRead,BufNewFile *.json set filetype=json

" switch to folder of current file
" au BufEnter * silent! lcd %:p:h

" Motion/Buffer
nmap <leader>w :bd<cr>
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

" Wildmenu - wildmenu is used for cli completion
set wildmenu
set wildmode=list:longest
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=*.pyc                            " Python byte code
set wildignore+=**.class                          " Cursed Java class files

" Plugins
" fzf.vim
" let $FZF_DEFAULT_COMMAND = 'rg ""'
let g:fzf_layout = { 'up': '~40%' }
nmap <leader>f :GFiles<CR>
nmap <leader>F :Rg<CR>
nmap <leader>e :Buffers<CR>
" ctrl+p

" " let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'  " search anything (in files, buffers and MRU files at the same time.)
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard']
" let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
" let g:ctrlp_root_markers = ['.git']
" let g:ctrlp_working_path_mode = 'ra' " search for nearest ancestor like .git, .hg, and the directory of the current file
" let g:ctrlp_match_window_bottom = 0 " show the match window at the top of the screen
" let g:ctrlp_max_height = 10 " maxiumum height of match window
" let g:ctrlp_switch_buffer = 'et' " jump to a file if it's open already
" let g:ctrlp_use_caching = 1 " enable caching
" let g:ctrlp_clear_cache_on_exit=0 " speed up by not removing clearing cache evertime
" let g:ctrlp_show_hidden = 0 " don't show me dotfiles
" let g:ctrlp_mruf_max = 250 " number of recently opened files
" nmap <leader>e :CtrlPBuffer<CR>
" nmap <leader>f :CtrlP<CR>

if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

" Gutentags
let g:gutentags_cache_dir="/home/oni/tags/"

" UltiSnips
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetDirectories=["/home/oni/.dotfiles/ultisnips-snippets"]
let g:UltiSnipsSnippetsDir="/home/oni/.dotfiles/ultisnips-snippets"
let g:UltiSnipsEditSplit="vertical"

" PhpActor
" Include use statement
nmap <c-p><c-u>u :call phpactor#UseAdd()<CR>

" Invoke the context menu
nmap <c-p><c-u>mm :call phpactor#ContextMenu()<CR>

" Invoke the navigation menu
nmap <c-p><c-u>nn :call phpactor#Navigate()<CR>

" Goto definition of class or class member under the cursor
nmap <c-p><c-u>o :call phpactor#GotoDefinition()<CR>

" Show brief information about the symbol under the cursor
nmap <c-p><c-u>K :call phpactor#Hover()<CR>

" Transform the classes in the current file
nmap <c-p><c-u>tt :call phpactor#Transform()<CR>

" Generate a new class (replacing the current file)
nmap <c-p><c-u>cc :call phpactor#ClassNew()<CR>

" Extract expression (normal mode)
nmap <silent><c-p><c-u>ee :call phpactor#ExtractExpression(v:false)<CR>

" Extract expression from selection
vmap <silent><c-p><c-u>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>

" Extract method from selection
vmap <silent><c-p><c-u>em :<C-U>call phpactor#ExtractMethod()<CR>
