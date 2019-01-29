" scrooloose/nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd BufEnter * if winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree() | q | endif
map <c-n> :NERDTreeToggle<cr>
let g:NERDTreeQuitOnOpen=1

" ervandew/supertab
let g:SuperTabDefaultCompletionType="<c-n>"

" vimtex
let g:vimtex_compiler_program='nvr'
let g:vimtex_view_method='zathura'

