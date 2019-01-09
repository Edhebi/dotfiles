set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.local/share/dein')
  call dein#begin('~/.local/share/dein')
  call dein#add('~/.local/share/dein/repos/github.com/Shougo/dein.vim')

  " utilities
  call dein#add('lambdalisue/suda.vim')

  " visual
  call dein#add('vim-airline/vim-airline')
  call dein#add('dylanaraps/wal.vim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('Xuyuanp/nerdtree-git-plugin')

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
 call dein#install()
 call dein#update()
 call dein#remote_plugins()
endif

"if len(dein#check_clean()) == 0
"  call map(dein#check_clean(), "delete(v:val, 'rf')")
"  call dein#recache_runtimepath()
"endif

filetype plugin indent on
syntax enable
