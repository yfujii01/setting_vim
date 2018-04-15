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



" " =============================================================
" " プラグイン設定(↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓)
" " =============================================================
" " ==========================
" " プラグイン設定(事前準備)
" " ==========================
" " mkdir %userprofile%\.vim\bundle
" " cd %userprofile%\.vim\bundle
" " git clone git://github.com/Shougo/neobundle.vim

" " ==========================
" " プラグイン設定
" " ==========================
" " :source $VIMRUNTIME/mswin.vim
"  " Note: Skip initialization for vim-tiny or vim-small.
"  if 0 | endif

"  if has('vim_starting')
"    if &compatible
"      set nocompatible               
"    endif

"    set runtimepath+=~/.vim/bundle/neobundle.vim/
"  endif

"  call neobundle#begin(expand('~/.vim/bundle/'))

"  NeoBundleFetch 'Shougo/neobundle.vim'

" " ==========================
" " 使用するプラグイン
" " ==========================
" " ファイルを表示
" NeoBundle 'https://github.com/Shougo/unite.vim.git'


"  call neobundle#end()

"  filetype plugin indent on

"  NeoBundleCheck
" " =============================================================
" " プラグイン設定(↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑)
" " =============================================================
