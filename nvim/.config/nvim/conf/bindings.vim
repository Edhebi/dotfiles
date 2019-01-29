let mapleader='ù'

" windows switching
nnoremap <c-h> <c-w><c-h>
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>

" simple splits
nmap <leader>sh :leftabove  vnew<cr>
nmap <leader>sj :rightbelow  new<cr>
nmap <leader>sk :leftabove   new<cr>
nmap <leader>sl :rightbelow vnew<cr>

nmap <leader>ssh :topleft  vnew<cr>
nmap <leader>ssj :botright  new<cr>
nmap <leader>ssk :topleft   new<cr>
nmap <leader>ssl :botright vnew<cr>

" send `d` and `c` to blackhole register
nnoremap <silent> c  "_c
xnoremap <silent> c  "_c
nnoremap <silent> cc "_S
nnoremap <silent> C  "_C
xnoremap <silent> C  "_C

nnoremap <silent> d  "_d
xnoremap <silent> d  "_d
nnoremap <silent> dd "_dd
nnoremap <silent> D  "_D
xnoremap <silent> D  "_D

" map x to act like old `d`
nnoremap <silent> x  d
xnoremap <silent> x  d
nnoremap <silent> xx dd
nnoremap <silent> X  D
xnoremap <silent> X  D

