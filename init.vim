" Plugins
"=============================================================================
" VimPlug: https://github.com/junegunn/vim-plug
" Install with :source ~/.vimrc | PlugInstall

" Specify a directory for plugins
call plug#begin('~/vimfiles/plugged')

"Plug 'flazz/vim-colorschemes'
"Plug 'felixhummel/setcolors.vim'
"Plug 'altercation/vim-colors-solarized'
"Plug 'lifepillar/vim-solarized8'
Plug 'NLKNguyen/papercolor-theme'
"Plug 'jonathanfilip/vim-lucius'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_powerline_fonts = 1

    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    " unicode symbols
    set encoding=utf-8

    " unicode symbols
    let g:airline_left_sep = '»'
    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '«'
    let g:airline_right_sep = '◀'
    let g:airline_symbols.linenr = '␊'
    let g:airline_symbols.linenr = '␤'
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.paste = 'Þ'
    let g:airline_symbols.paste = '∥'
    let g:airline_symbols.whitespace = 'Ξ'

    " airline symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''

Plug 'jelera/vim-javascript-syntax'
Plug 'vim-scripts/JavaScript-Indent'

Plug 'Shougo/unite.vim'

"Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/vimproc.vim'
    let g:vimproc#download_windows_dll = 1

Plug 'ctrlpvim/ctrlp.vim'
    let g:ctrlp_working_path_mode = 'rw'
    "let g:ctrlp_user_command = '\bin\ag.exe --nocolor --hidden -g "" %s'
    let g:ctrlp_user_command = 'pt --nogroup -S --ignore=node_modules --global-gitignore -g "" %s'

Plug 'dyng/ctrlsf.vim'
    let g:ctrlsf_ackprg = 'rg'

Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
    let g:session_autosave = 'yes'
    let g:session_autoload = 'yes'

" Initialize plugin system
call plug#end()

" General settings
"===============================================================================
set nocompatible
syntax enable
"set guifont=Hack:h10:cANSI:qDRAFT
"set guifont=Droid_Sans_Mono_Dotted_for_Powe:h10:cANSI:qDRAFT
set guifont=DejaVu_Sans_Mono_For_Powerline:h10:cANSI:qDRAFT
"set guifont=Fira_Mono_For_Powerline:h11:cANSI:qDRAFT

set background=light
colorscheme PaperColor " tutticolor colorful lucius

filetype on
filetype indent on
filetype plugin on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set number " show line numbers
set hlsearch " highlight search
set incsearch " incremental search
set ignorecase
set smartcase
set infercase " better case handling for insert mode completion

set smartindent
"set autoindent
set autoread " automatically reload files changed outside Vim
set autowrite " automatically write files when doing things like :make

set cmdheight=2
set laststatus=2
set showcmd
set showfulltag
set shortmess+=ts

" make backspace work
set bs=2

if has("gui_running")
    set guioptions-=T
    au GUIEnter * simalt ~x  "maximize
endif

set autowriteall
set wildchar=<Tab> wildmenu wildmode=longest:full,full

set cursorline
set clipboard=unnamed " use system clipboard

set fileformats=unix,dos

" Key mappings
"===============================================================================
let mapleader = ","
imap jk <Esc>
set timeoutlen=500
vnoremap <C-c> "*y
inoremap <C-v> <C-O>"*P

" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command! -nargs=0 -bar Update if &modified 
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
nnoremap <silent> <C-S> :<C-U>Update<CR>
nnoremap <Leader>w :<C-U>Update<CR>
vnoremap <silent> <C-S> <C-C>:Update<CR>
inoremap <silent> <C-S> <C-O>:Update<CR>

"splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"finding files
nnoremap <silent><leader>f :<C-U>CtrlPMixed<CR>
nnoremap <silent><C-p> :<C-U>CtrlPMixed<CR>
nnoremap <silent><leader>b :<C-U>CtrlPBuffer<CR>

"searching in files
nmap     <leader>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>
nmap     <C-F>l <Plug>CtrlSFQuickfixPrompt
vmap     <C-F>l <Plug>CtrlSFQuickfixVwordPath
vmap     <C-F>L <Plug>CtrlSFQuickfixVwordExec


