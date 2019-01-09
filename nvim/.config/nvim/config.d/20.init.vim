let $NVIM_TUI_ENABLE_TRUE_COLOR=1

set backspace=indent,eol,start
set number
set relativenumber
set scrolloff=10

" theme
colorscheme wal
set t_Co=255
set background=dark
let g:airline_theme='wal'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enable=1
let g:airline#extensions#tabline#formatter='unique_tail_improved'

" NERDTree
