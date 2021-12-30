"######################
"### GENERAL CONFIG ###
"######################
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set noswapfile  
set scrolloff=8
set autoindent              " indent a new line the same amount as the line just typed
set number relativenumber   " add (rlative) line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
"set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download
" language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.
let mapleader = ";"          " Leader key 

" open new split panes to right and below
set splitright
set splitbelow

"###############
"### PLUGINS ###
"###############

call plug#begin("~/.vim/plugged")
 " Cosmetic stuff
 Plug 'dracula/vim' " duacula theme for VIM
 Plug 'kyazdani42/nvim-web-devicons'
 Plug 'itchyny/lightline.vim' " Line below editor with vi edit mode
 Plug 'fladson/vim-kitty' " Higlighting for kitty config file
 Plug 'mhinz/vim-startify' " Fancier srart screen wiht shortcuts
 
 Plug 'tpope/vim-commentary'   " Easy commenting with 'gcc' shortcut
 Plug 'tpope/vim-sensible' " Sensible default for VIM (good start point)
 Plug 'tpope/vim-vinegar'
 Plug 'neoclide/coc.nvim', {'branch': 'release'} " Code autocomplete
 " FZF search 
 Plug 'junegunn/fzf', { 'do': { -> fzf#install() }}
 Plug 'junegunn/fzf.vim' 

 " Telescope file picker
 Plug 'nvim-lua/plenary.nvim'
 Plug 'nvim-telescope/telescope.nvim'
 Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

 Plug 'jupyter-vim/jupyter-vim'
call plug#end()

" color schemes
if (has("termguicolors"))
    set termguicolors
endif
syntax enable
colorscheme dracula

"##################
"### CoC config ###
"##################
" coc extensions
let g:coc_global_extensions = [
            \ 'coc-snippets',
            \ 'coc-json',
            \ 'coc-pyright',
            \ 'coc-tsserver',
            \ 'coc-json',
            \ ]
" autocomplete on <TAB>
noremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"########################
"### Telescope config ###
"########################
lua require('plugins_config')

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fd <cmd>Telescope file_browser<cr>

