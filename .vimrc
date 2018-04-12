syntax on
colorscheme evening

" set encoding=japan
set fileencodings=utf-8,sjis,iso-2022-jp,euc-jp
" set fileencodings=sjis,utf-8,iso-2022-jp,euc-jp


" " vimdiffの色設定
" hi DiffAdd    ctermfg=black ctermbg=2
" hi DiffChange ctermfg=black ctermbg=3
" hi DiffDelete ctermfg=black ctermbg=6
" hi DiffText   ctermfg=black ctermbg=7

" vimdiff 差分があればその前後n行を表示する
set diffopt=filler,context:10000


set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" Bundle 'tpope/vim-fugitive'
Plugin 'vim-scripts/dbext.vim'