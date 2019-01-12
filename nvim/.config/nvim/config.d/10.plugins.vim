set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.local/share/dein')
  call dein#begin('~/.local/share/dein')
  call dein#add('~/.local/share/dein/repos/github.com/Shougo/dein.vim')

  " completion
  " complet#add('Shougo/d
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/neoinclude.vim')
  call dein#add('autozimu/LanguageClient-neovim', {
    \ 'rev': 'next',
    \ 'build': 'bash install.sh',
    \ })

  " utilities
  call dein#add('lambdalisue/suda.vim')
  call dein#add('jalvesaq/nvim-r')

  " visual
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('dylanaraps/wal.vim')
  call dein#add('morhetz/gruvbox')
  call dein#add('scrooloose/nerdtree')
  call dein#add('Xuyuanp/nerdtree-git-plugin')

  call dein#end()
  call dein#save_state()
endif

let g:python_host_prog = '/bin/python2'
let g:python3_host_prog = '/bin/python3'

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
" call dein#update()
" call dein#remote_plugins()
endif

"if len(dein#check_clean()) == 0
"  call map(dein#check_clean(), "delete(v:val, 'rf')")
"  call dein#recache_runtimepath()
"endif

