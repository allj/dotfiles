set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set number
set relativenumber
set cursorline
set nowrap
let mapleader = ";"

call plug#begin('~/.local/share/nvim/plugged')

Plug 'sickill/vim-monokai'
Plug 'morhetz/gruvbox'
Plug 'ervandew/supertab'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'majutsushi/tagbar'
Plug 'easymotion/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'sjl/gundo.vim'
Plug 'jparise/vim-graphql'
Plug 'udalov/kotlin-vim'
Plug 'jaxbot/semantic-highlight.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'neomake/neomake'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'fatih/vim-go'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
Plug 'mbbill/undotree'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'elzr/vim-json'
Plug 'ziglang/zig.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope.nvim'

call plug#end()

syntax on
colorscheme gruvbox
set bg=dark
set termguicolors

filetype on
filetype plugin on
filetype indent on

autocmd FileType javascript setlocal sw=2 sts=2 et

" This unsets the 'last search pattern' register
nnoremap <Bslash> :noh<CR>

" Ctrl-P with fzf
nnoremap <C-p> :FZF<CR>
nnoremap <leader>f :FZF<CR>

" Fzf buffers
nnoremap <leader>b :Buffers<CR>

" Fzf windows
nnoremap <leader>w :Windows<CR>

" Fzf search history
nnoremap <leader>/ :History/<CR>

" Fzf marks
nnoremap <leader>m :Marks<CR>

" Commits
nnoremap <leader>c :BCommits<CR>

" Filetypes
nnoremap <leader>t :Filetypes<CR>

let g:airline#extensions#tabline#enabled = 1

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
