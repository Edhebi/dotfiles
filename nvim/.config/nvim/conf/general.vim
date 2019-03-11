let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set backspace=indent,eol,start
set number
set relativenumber
set cursorline
set ruler
set scrolloff=10
set modeline
set modelines=5

" tabs
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
autocmd BufWritePre * %s/\s\+$//e

" theme
set termguicolors
set background=dark
colorscheme nord
set t_Co=255
let g:airline_theme='nord'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enable=1
let g:airline#extensions#tabline#formatter='unique_tail_improved'

" folding
set foldmethod=syntax
set foldcolumn=1
set foldlevelstart=3
nnoremap <silent> <c-space> za<cr>

" terminal
tnoremap <esc> <c-\><c-n>
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

" git
if has('nvim')
  let $GIT_EDITOR = 'nvr -cc split --remote-wait'
endif
autocmd FileType gitcommit set bufhidden=delete
