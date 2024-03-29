"Neo VIM setting
"Author: Ahn-JH, 0421ajh@naver.com


"======================= General Setting =======================
if has("syntax")
     syntax on
 endif
filetype plugin indent on
filetype plugin on
let mapleader=","
set history=1000
set ruler
set showmatch
set bg=dark
set nu
set hlsearch
set clipboard=unnamed
"if (executable('pbcopy') || executable('xclip') || executable('xsel')) && has('clipboard')
"    set clipboard=unnamed
"endif
set mouse=a

"Statusline Setting
set laststatus=2
set statusline=%F\ %y%m%r\ %=Line:\ %l/%L\ [%p%%]\ Col:%c\ Buf:%n
"========================= Indentation =========================
set tabstop=4                       
set softtabstop=4                  
set shiftwidth=4                  
set autoindent                  
set expandtab                  
set smartindent

"========================= Key Mapping =========================
map <leader>w :w
map <leader>q :q
map <F2> :w<Enter>: !python %<Enter>

imap <A-.> <ESC>
vmap <A-.> <ESC>
nnoremap <leader>src :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>init :tabe ~/.config/nvim/init.vim<CR>
nnoremap <leader>language :tabe ~/.config/nvim/language.vim<CR>
nnoremap <leader>kite :tabe ~/.config/nvim/kite.vim<CR>

tnoremap <Esc> <C-\><C-n>:q!<CR>

"Key mapping for block with shift + arrow
nmap <S-Up> v<Up>
nmap <S-Down> v<Down>
nmap <S-Left> v<Left>
nmap <S-Right> v<Right>
vmap <S-Up> <Up>
vmap <S-Down> <Down>
vmap <S-Left> <Left>
vmap <S-Right> <Right>
imap <S-Up> <Esc>v<Up>
imap <S-Down> <Esc>v<Down>
imap <S-Left> <Esc>v<Left>
imap <S-Right> <Esc>v<Right>

map <C-Up> N
map <C-Down> n

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
" CTRL-V and SHIFT-Insert are Paste
"map <C-V>       "+gP
"cmap <C-V>      <C-R>+
noremap <c-v> <esc>:set paste<cr>a<c-r>=getreg('+')<cr><esc>:set nopaste<cr>mi`[=`]`ia
"=========================== Plugins =============================

call plug#begin("~/.local/share/nvim/plugged")

Plug 'preservim/nerdtree' 
"Plug 'https://github.com/rkulla/pydiction.git'
Plug 'https://github.com/vim-python/python-syntax.git'
Plug 'Yggdroot/indentLine'
Plug 'mhinz/vim-startify' 
Plug 'scrooloose/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'patstockwell/vim-monokai-tasty'
Plug 'crusoexia/vim-monokai'
"Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'jackguo380/vim-lsp-cxx-highlight'
"Go lang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"For Color Scheme
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'rakr/vim-two-firewatch'
Plug 'AlessandroYorba/Sierra'
Plug 'ayu-theme/ayu-vim' " or other package manager
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'tomasr/molokai'
call plug#end()
"========================== NERDTree =============================
"open NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif  

"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif 

"Remove Press ? for help
let NERDTreeMinimalUI = 1

"Arrow Setting
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"Key mapping NERDTree Toggle
map <C-n> :NERDTreeToggle<CR> 

"========================== python syntax =========================

let g:python_highlight_all = 1
set termguicolors
let g:molokai_original = 1
let g:rehash256 = 1
color molokai

"========================== CPP syntax ============================
" Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_variable_highlight = 1
let g:cpp_class_scope_highlight = 1
let g:cpp_class_decl_highlight = 1

"========================== GO syntax ==============================
let g:go_fold_enable = ['block', 'import', 'varconst', 'package_comment']

"==========================g NERD Commenter ==========================

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" customize keymapping
map <Leader>cc <plug>NERDComToggleComment
map <Leader>c<space> <plug>NERDComComment


" source ~/.config/nvim/kite.vim
source ~/.config/nvim/language.vim 
