set nocompatible

" Plugins!
call plug#begin('~/.vim/plugged')
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-surround'
Plug 'ludovicchabant/vim-gutentags'
Plug 'lervag/vimtex'
Plug 'ajh17/VimCompletesMe'
call plug#end()

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

"set termguicolors
if exists('+termguicolors')
    let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark='hard'

highlight SpellBad cterm=underline
highlight SpellCap cterm=underline
highlight SpellLocal cterm=underline

set encoding=utf-8

set conceallevel=0
set concealcursor=c

let g:tex_flavor="latex"
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
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
let wiki_1.auto_toc = 1
let g:vimwiki_list = [wiki_1]
let g:vimwiki_toc_header = 'Index'


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
