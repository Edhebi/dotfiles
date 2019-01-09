if &compatible
  set nocompatible
endif

for f in split(glob('~/.config/nvim/config.d/*.vim'), '\n')
  exe 'source' f
endfor
