call plug#begin()
	Plug 'jiangmiao/auto-pairs'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'frazrepo/vim-rainbow'
call plug#end()

" colo rein

set background=dark
set clipboard=unnamedplus
set completeopt=noinsert,menuone,noselect
set mouse=a
set splitbelow splitright
set shiftwidth=2
set tabstop=2
set title
set ttimeoutlen=0
set wildmenu
set ruler
set incsearch

let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

" statusline stuff
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunc

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunc

set statusline=
set statusline+=%2*\%{StatuslineGit()}
set statusline+=%4*\%f
set statusline+=%=
set statusline+=%4*\ %l
set statusline+=%3*\ %{&filetype}


nnoremap <backspace> x

filetype plugin indent on
syntax on

