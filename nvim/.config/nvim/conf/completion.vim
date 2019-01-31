" ludovicchabant/gutentags
let g:gutentags_cache_dir=expand('~/.cache/vim_tags')
set statusline+=%{gutentags#statusline()}

augroup GutentagsAirlineRefresh
  autocmd!
  autocmd User GutentagsUpdating call airline#update_statusline()
  autocmd User GutentagsUpdated  call airline#update_statusline()
augroup END

" c0r37x/neotags.nvim
let g:neotags_enabled=0
let g:neotags_directory=expand('~/.cache/vim_tags')
let g:neotags_run_ctags=0

" majutsushi/tagbar
nmap <F8> :TagbarToogle<CR>

" Shougo/deoplete
let g:deoplete#enable_at_startup=1
let g:deoplete#enable_smart_case=1

let b:deoplete_disable_auto_complete=1
let g:deoplete_disable_auto_complete=1

call deoplete#custom#source('LanguageClient', 'min_pattern_length', 2)

if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns={}
endif

call deoplete#custom#source('_', 'disable_syntaxes', ['Comment', 'String'])

call deoplete#custom#option('sources', {
  \ 'c'  : ['LanguageClient'],
  \ 'cpp': ['LanguageClient'],
  \ })

let g:deoplete#ignore_sources={}
let g:deoplete#ignore_sources._=['buffer', 'around']

" autozimu/LanguageClient

let g:LanguageClient_serverCommands={
  \ 'c':   ['clangd'],
  \ 'cpp': ['clangd'],
  \ }

let g:LanguageClient_autoStart=1
let g:LanguageClient_rootMarkers={
  \ 'c':   ['compile_commands.json', 'build', '.git'],
  \ 'cpp': ['compile_commands.json', 'build', '.git'],
  \ }

set completefunc=LanguageClient#complete
set formatexpr=LanguagueClient_textDocument_rangeFormatting()

"let g:LanguageClient_loadSettings=1
"let g:LanguageClient_settingsPath=
