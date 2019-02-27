call plug#begin('~/.config/nvim/bundle')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/denite.nvim'
Plug 'OrangeT/vim-csharp'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Quramy/tsuquyomi'
Plug 'Quramy/vim-dtsm'
Plug 'Quramy/vim-js-pretty-template'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'
Plug 'flazz/vim-colorschemes'
Plug 'jiangmiao/auto-pairs'
Plug 'joshdick/onedark.vim'
Plug 'jreybert/vimagit'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim'
Plug 'justinmk/vim-sneak'
Plug 'leafgarland/typescript-vim'
Plug 'maksimr/vim-jsbeautify'
Plug 'mattn/emmet-vim'
Plug 'mhartington/nvim-typescript'
Plug 'mhartington/oceanic-next'
Plug 'mileszs/ack.vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'trevordmiller/nova-vim'
Plug 'w0rp/ale'
Plug 'ayu-theme/ayu-vim'

Plug 'pelodelfuego/vim-swoop'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" basics
filetype plugin indent on
syntax on set number
set relativenumber
set incsearch
set ignorecase
set smartcase
set nohlsearch
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set nobackup
set noswapfile
set nowrap
set hlsearch
set inccommand=nosplit

" preferences
inoremap jk <ESC>
let mapleader = "\<Space>"
set pastetoggle=<F2>

filetype plugin on

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Copy/Paste helpers
nnoremap <Leader>d "_d
nnoremap <Leader>dd "_dd
nnoremap <Leader>y "+y
nnoremap <Leader>yy "+yy
nnoremap <Leader>P "+P
nnoremap <Leader>p "+p
inoremap fd <Esc>
nnoremap <Leader>no :noh<CR>

nnoremap <Leader>ti :TSImport<CR>
nnoremap <Leader>tt :TSTypeDef<CR>
nnoremap <Leader>td :TSDef<CR>
nnoremap <Leader>tr :TSRefs<CR>
nnoremap <Leader>to :TSGetDocSymbols<CR>
nnoremap <Leader>ts :TSRename<CR>

" Keymaps for plugins FZF and Ag
nnoremap <C-p> :GFiles<CR>
nnoremap <C-o> :Ag<CR>
nnoremap <Leader>bb :Buffers<CR>
nnoremap <Leader>ss :BLines<CR>
nnoremap <Leader>fs :w<CR>
" Stay in visual mode when indenting. You will never have to run gv after
" performing an indentation.
vnoremap < <gv
vnoremap > >gv
" Make Y yank everything from the cursor to the end of the line. This makes Y
" act more like C or D because by default, Y yanks the current line (i.e. the
" same as yy).
noremap Y y$
" navigate split screens easily
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Switching between buffers F8 and Shift F8
set switchbuf=newtab
nnoremap <F8> :sbnext<CR>
nnoremap <S-F8> :sbprevious<CR>

" Tab switching movement
nnoremap <C-S-Left> :tabprevious<CR>
nnoremap <C-S-Right> :tabnext<CR>
nnoremap <C-S-Up> :tabnew<CR>
nnoremap <C-S-Down> :tabclose<CR>
nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>

" buffer specific
nnoremap <Leader>bp :bprevious<CR>
nnoremap <Leader>bn :bnext<CR>
nnoremap <Leader>bd :bdelete<CR>

" fugitive specific
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gp :Gpush<CR>

" change spacing for language specific
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4

" plugin settings
" let g:deoplete#enable_at_startup = 1
" let g:python3_host_prog = 'C:\Python36\python.exe'
let g:ackprg = 'ag --vimgrep'
let g:fzf_layout = { 'down': '~40%' }
let g:tsuquyomi_shortest_import_path = 1

let g:ale_linters = {
            \}

" w0rp/ale
" Limit linters used for JavaScript.
let g:ale_linters = {
\  'javascript': ['flow', 'eslint'],
\  'typescript': ['tslint'],
\  'html': ['']
\}
highlight clear ALEErrorSign " otherwise uses error bg color (typically red)
highlight clear ALEWarningSign " otherwise uses error bg color (typically red)
let g:ale_sign_error = 'X' " could use emoji
let g:ale_sign_warning = '?' " could use emoji
let g:ale_statusline_format = ['X %d', '? %d', '']
" %linter% is the name of the linter that provided the message
" %s is the error or warning message
let g:ale_echo_msg_format = '%linter%: %s'
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
" Map keys to navigate between lines with errors and warnings.
nnoremap <leader>an :ALENextWrap<cr>
nnoremap <leader>ap :ALEPreviousWrap<cr>
 
" Lint only after file save
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
 
" Use quickfix instead of loclist for lint bugs
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_open_list = 0 " autoopen list
 
" ALE fixers
" integration of prettier with eslint requires prettier-eslint and
" prettier-eslint-cli packages
" let g:ale_fixers = ['prettier-eslint']
let g:ale_fixers = ['prettier', 'eslint']
nmap <leader>p <Plug>(ale_fix)
let g:ale_fix_on_save = 0
" \w0rp/ale


" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0
let g:airline_solarized_bg='dark'
let g:airline_theme='onedark'

" NERDCommenter 
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" use tab to forward cycle
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" use tab to backward cycle
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" Close the documentation window when completion is done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Theme
syntax on
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" set termguicolors
" set background=dark
colorscheme onedark

"NERDTree
" How can I close vim if the only window left open is a NERDTree?
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" toggle NERDTree
map <Leader>nf :NERDTreeFind<CR>
map <Leader>nn :NERDTree<CR>
map <Leader>nt :NERDTreeToggle<CR>
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__', 'node_modules']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinPos = "left"
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

" jsx
let g:jsx_ext_required = 0

" ale prettier-eslint
"let g:ale_fixers = {
"\   'javascript': ['prettier_eslint'],
"\}
"let g:ale_fix_on_save = 1
"let g:ale_javascript_prettier_eslint_executable = 'prettier-eslint'
"let g:ale_javascript_prettier_eslint_use_global = 1
com! FormatJSON %!python -m json.tool
