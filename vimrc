set nocompatible
filetype off " required for Vundle

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vimwiki/vimwiki'
Plugin 'reedes/vim-pencil'

call vundle#end()

inoremap jk <ESC>
let mapleader = "\<Space>"

set confirm
set hidden
set showcmd
set showmode

set relativenumber
set number
set numberwidth=5

filetype plugin indent on
syntax on

colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark='medium'

set encoding=utf-8

set conceallevel=2
set concealcursor=nvc
let g:tex_conceal="adgms"

set tabstop=4
set shiftwidth=4
set softtabstop=0 noexpandtab

set ignorecase
set smartcase

augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

set laststatus=2

function GitBranch()
    let gitbranch = system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
    if len(gitbranch) > 0
		let b:gitstatus = " " . gitbranch
    else
        let b:gitstatus = ''
    endif
endfunc
autocmd BufEnter,BufWritePost * call GitBranch()

set statusline=
set statusline+=\ ☰\ :%c\ 
set statusline+=%#keyword#
set statusline+=\ ‹‹\ %f
set statusline+=%m
set statusline+=%r\ ››\ 
set statusline+=%#StatusLineNC#
set statusline+=%=
set statusline+=%#ColorColumn#
set statusline+=\ %{b:gitstatus}\ 
