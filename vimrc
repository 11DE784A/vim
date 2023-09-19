set nocompatible

" Plugins!
call plug#begin('~/.vim/plugged')
Plug '11de784a/gruvbox'
Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-surround'
Plug 'ludovicchabant/vim-gutentags'
Plug 'juliaeditorsupport/julia-vim'
Plug 'bfrg/vim-cpp-modern'
Plug 'axvr/zepl.vim'
Plug 'junegunn/rainbow_parentheses.vim'
" Plug 'kien/rainbow_parentheses.vim'
" Plug 'luochen1990/rainbow'
" Plug 'vim-scripts/paredit.vim'
Plug 'sirver/ultisnips'
call plug#end()

inoremap jk <ESC>
let mapleader = "\<Space>"

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

"More natural splits
set splitright

set confirm
set hidden
set showcmd
set showmode

set relativenumber
set number
set numberwidth=5

filetype indent plugin on
syntax on

set encoding=utf-8

set conceallevel=0

let g:latex_to_unicode_file_types = ".*"
let g:latex_to_unicode_file_types_blacklist = "tex"

if (has('termguicolors'))
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif

set background=dark

let g:gruvbox_italic=1
let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox

set scrolloff=7
set tabstop=4
set shiftwidth=4
set softtabstop=0 expandtab
set smarttab

set ignorecase
set smartcase

set spelllang=en_gb

" Zepl configuration
let g:repl_config = {
			\ "scheme": { "cmd": "mit-scheme" },
			\ "julia": { "cmd": "julia" }
			\ }

hi SpellBad gui=undercurl cterm=underline
hi SpellCap gui=undercurl cterm=underline
hi SpellLocal gui=undercurl cterm=underline

hi htmlItalic gui=italic cterm=italic

let g:rainbow#max_level = 8
let g:rainbow#pairs = [['(', ')'], ['[', ']']]
let g:rainbow#blacklist = [208, '#fe8019', 250, '#d5c4a1', 223, '#ebdbb2']

augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
augroup END

augroup resCur
  autocmd!
  autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

set laststatus=2

function GitBranch()
	let gitbranch = system("git -C " . expand("%:p:h") . " rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
    if len(gitbranch) > 0
		let b:gitstatus = ' git:' . gitbranch . ' '
    else
        let b:gitstatus = ''
    endif
endfunc
autocmd BufEnter,BufWritePost * call GitBranch()

hi StatusLine guifg=#1d2021 guibg=#bdae93
hi StatusLineNC guifg=#1d2021 guibg=#665c54
hi StatusLineTerm guibg=#1d2021 guifg=#bdae93
hi StatusLineTermNC guibg=#1d2021 guifg=#665c54

hi User1 guibg=#504945
hi User2 guibg=#32302f

set statusline=
set statusline+=%1*\ buf:%n\ 
set statusline+=%2*%{b:gitstatus}
set statusline+=%*\ %F%m%r%h%w
set statusline+=%=
set statusline+=%y\ 
set statusline+=%2*\ %{&ff}\ 
set statusline+=%1*\ ln:%l/%L\ %p%%\ 

