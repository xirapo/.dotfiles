" Vimrc
"
" Maintainer:
"	Francisco Garcia
"	fgarciadiaz29@gmail.com
"
" Version:
"	1.0 - 26/07/2017
"
" Sections:
"	-General
"	-Plugins
"	-custom settings
""""""""""""""""""""""""""""""""""

""""
" General
"""""""""""

" Automatic reloading of .vimrc
    autocmd! BufWritePost .vimrc source %
" mapping esc key
    imap jj <esc>
" Number lines
    set number
" Leader mapkey
    let mapleader=","
" Map the :w as a key path
    noremap <C-Z> :update<CR>
    vnoremap <C-Z> <C-C>:update<CR>
    inoremap <C-Z> <C-O>:update<CR>
" Show command in bottom bar
    set showcmd
" Bind Ctrl+ keys to move around the windows, instead of using Ctrl+w+<key>
    map <c-j> <c-w>j " down
    map <c-k> <c-w>k " up
    map <c-l> <c-w>l " right
    map <c-h> <c-w>h " left
" Moving between tabs
    map <Leader>n <esc>:tabprevious<CR>
    map <Leader>m <esc>:tabnext<CR>
" Show matching parenthesis
    set showmatch 
" Searching
    set ignorecase
    set incsearch
    set hlsearch
    set smartcase
" Visual autocomplete for command menu
    set wildmenu
" tabs spaces
    set noexpandtab
	set expandtab
	set tabstop=4
	set softtabstop=4
	set shiftwidth=4
" indentation
	set autoindent
    set smartindent
" text-width 
	set textwidth=80
" ruler
    set ruler
" no compatible
    set nocompatible
" filetype
    filetype off
    filetype plugin indent on
" hidden
    set hidden
" syntax
    syntax enable
" column color
    let &colorcolumn=80
" History level
    set history=700
    set undolevels=700
" Disable the backup, swaps levels  
    set nobackup
    set nowritebackup
    set noswapfile

""""
" Plugins
"""""""""""

" Plugins will be downloaded under the specified directory
    call plug#begin('~/.vim/plugged')
" List of plugin
    Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' }
    Plug 'vim-syntastic/syntastic'
    Plug 'scrooloose/nerdtree'
    Plug 'tpope/vim-fugitive'
    Plug 'pangloss/vim-javascript'
" Colorscheme
    Plug 'dracula/vim'
    Plug 'vim-scripts/Wombat'
    Plug 'MPiccinato/wombat256'
    Plug 'lsdr/monokai'
    Plug 'yantze/pt_black'
    Plug 'hzchirs/vim-material'
    Plug 'kien/ctrlp.vim'
    Plug 'powerline/powerline'
    call plug#end()

""""
" Custom Settings
"""""""""""""""""""

" ColorScheme
    colorscheme wombat256
"    set background=dark
" syntastic settings
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
" Nerdtree settings
    " Open when no files are specified
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    " open nerdtree on a open directory
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
    " map key for open and close nerdtree
    map <C-n> :NERDTreeToggle<CR>
    " arrow style
    let g:NERDTreeDirArrowExpandable = '▸'
    let g:NERDTreeDirArrowCollapsible = '▾'
" Python Version for YCM
    let g:ycm_server_python_interpreter = '/usr/bin/python2'
" Ctrl p
    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cmd = 'CtrlP'
    let g:ctrlp_working_path_mode = 'ra'
" Vim- javascript confi
    let g:javascript_plugin_jsdoc = 1
    let g:javascript_plugin_ngdoc = 1
    let g:javascript_plugin_flow = 1
    set foldmethod=syntax
" Powerline conf
    set  rtp+=~/.vim/plugged/powerline/powerline/bindings/vim
    set laststatus=2
    set t_Co=256
