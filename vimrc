set nocompatible

"Vundle stuff
filetype off " required for Vundle

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vimwiki/vimwiki'
Plugin 'PegasusWang/vim-ubuntu-pastebin'
Plugin 'rust-lang/rust.vim'

call vundle#end()
"End Vundle stuff

inoremap jk <ESC>
let mapleader = "\<Space>"

"Easier splits navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"More natural splits
set splitbelow
set splitright

"Stuff to execute the file I am currently working on
nnoremap <leader>gg :w<CR> :!gnuplot %<CR>

set confirm
set hidden
set showcmd
set showmode

set relativenumber
set number
set numberwidth=5

filetype indent plugin on
syntax on

set termguicolors
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark='hard'

set encoding=utf-8

set conceallevel=2
set concealcursor=c
let g:tex_conceal="abdmgs"

set tabstop=4
set shiftwidth=4
set softtabstop=0 noexpandtab
set smarttab

set ignorecase
set smartcase

let wiki_1 = {}
let wiki_1.path = '~/wiki/'
let wiki_1.syntax = 'markdown'
let wiki_1.ext = '.md'
let g:vimwiki_list = [wiki_1]

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
