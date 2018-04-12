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


" set nocompatible               " be iMproved
" filetype off                   " required!
" set rtp+=~/.vim/bundle/vundle/
" call vundle#rc()
" " Bundle 'tpope/vim-fugitive'
" Plugin 'vim-scripts/dbext.vim'

:source $VIMRUNTIME/mswin.vim
 " Note: Skip initialization for vim-tiny or vim-small.
 if 0 | endif

 if has('vim_starting')
   if &compatible
     set nocompatible               
   endif

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " NeoBundle 設定
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'

 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
 " Note: neobundle の設定を.gvimrcに書かないこと！

 " ここに追加したいプラグインを追加します。 
" NeoBundle 'https://github.com/Shougo/neocomplcache.git'
NeoBundle 'https://github.com/Shougo/unite.vim.git'
" NeoBundle 'https://github.com/Shougo/vimshell.git'
" NeoBundle 'https://github.com/Shougo/vimproc.git'

 call neobundle#end()

 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck
