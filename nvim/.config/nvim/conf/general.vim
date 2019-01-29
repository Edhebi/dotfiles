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
set softtabstop=0
set noexpandtab
set shiftwidth=4

" theme
set termguicolors
set background=dark
colorscheme gruvbox
set t_Co=255
let g:airline_theme='gruvbox'
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
