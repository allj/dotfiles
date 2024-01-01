set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set number
set relativenumber
set cursorline
set nowrap
set incsearch
let mapleader = ";"

call plug#begin('~/.local/share/nvim/plugged')

" Plug 'sickill/vim-monokai'
Plug 'morhetz/gruvbox'
Plug 'ervandew/supertab'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'easymotion/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'sjl/gundo.vim'
Plug 'jparise/vim-graphql'
Plug 'udalov/kotlin-vim'
Plug 'jaxbot/semantic-highlight.vim',  { 'on': 'SemanticHighlightToggle' }
Plug 'jeffkreeftmeijer/vim-numbertoggle'
" Plug 'neomake/neomake'
Plug 'leafgarland/typescript-vim'
Plug 'pangloss/vim-javascript'
Plug 'fatih/vim-go'
Plug 'mbbill/undotree'
" Plug 'JuliaEditorSupport/julia-vim', { 'for': 'julia' }
Plug 'elzr/vim-json'
Plug 'ziglang/zig.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-telescope/telescope.nvim'
" Plug 'github/copilot.vim'
Plug 'dense-analysis/ale'

call plug#end()

syntax on
colorscheme gruvbox
set bg=dark
set termguicolors

filetype on
filetype plugin on
filetype indent on

autocmd FileType javascript setlocal sw=2 sts=2 et
autocmd FileType typescript setlocal sw=2 sts=2 et
autocmd FileType json setlocal sw=2 sts=2 et
autocmd FileType yaml setlocal sw=2 sts=2 et
autocmd FileType toml setlocal sw=2 sts=2 et
autocmd FileType sh setlocal sw=2 sts=2 et
autocmd FileType zsh setlocal sw=2 sts=2 et
autocmd FileType bash setlocal sw=2 sts=2 et

" This unsets the 'last search pattern' register
nnoremap <Bslash> :noh<CR>

" Ctrl-P with fzf
nnoremap <C-p> :FZF<CR>
nnoremap <leader>fzf :FZF<CR>

" Fzf windows
nnoremap <leader>fw :Windows<CR>

" Fzf search history
nnoremap <leader>f/ :History/<CR>

" Fzf marks
nnoremap <leader>fm :Marks<CR>

" Commits
nnoremap <leader>fc :BCommits<CR>

" Filetypes
nnoremap <leader>ft :Filetypes<CR>

let g:airline#extensions#tabline#enabled = 1

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <leader>tu <cmd>UndotreeToggle<cr>
nnoremap <leader>tg <cmd>TagbarToggle<cr>
nnoremap <leader>ts <cmd>SemanticHighlightToggle<cr>
