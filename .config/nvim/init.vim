set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath

set nocompatible
set number
set relativenumber
set clipboard=unnamedplus
set tabstop=4
set shiftwidth=4 
set expandtab
syntax on
set autoindent
set autowrite
set ruler
set showcmd
set wildmenu

" search
set smartcase
set ignorecase

set splitbelow splitright

call plug#begin()
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
call plug#end()

lua << END
require('lualine').setup()
END

