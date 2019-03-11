set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.local/share/dein')
  call dein#begin('~/.local/share/dein')
  call dein#add('~/.local/share/dein/repos/github.com/Shougo/dein.vim')

  " completion
  call dein#add('ludovicchabant/vim-gutentags')
  call dein#add('c0r73x/neotags.nvim')
  call dein#add('majutsushi/tagbar')
  call dein#add('lervag/vimtex')
  call dein#add('beyondmarc/glsl.vim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/neoinclude.vim')
  call dein#add('autozimu/LanguageClient-neovim', {
    \ 'rev': 'next',
    \ 'build': 'bash install.sh',
    \ })

  " utilities
  call dein#add('ervandew/supertab')
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('tpope/vim-speeddating')
  call dein#add('tpope/vim-repeat')
  call dein#add('svermeulen/vim-yoink')
" call dein#add('svermeulen/vim-subversive')
  call dein#add('lambdalisue/suda.vim')
  call dein#add('jalvesaq/nvim-r')

  " visual
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('arcticicestudio/nord-vim')
  call dein#add('scrooloose/nerdtree')
  call dein#add('Xuyuanp/nerdtree-git-plugin')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
"  call dein#update()
"  call dein#remote_plugins()
endif

"if len(dein#check_clean()) != 0
"  call map(dein#check_clean(), "delete(v:val, 'rf')")
"  call dein#recache_runtimepath()
"endif

set runtimepath+=~/.local/share/dein/.cache/init.vim/.dein/ftdetect/ftdetect.vim

