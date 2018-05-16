"===============================
" 起動時設定
"===============================
if filereadable(expand('~/.vimInit.vim'))
  source ~/.vimInit.vim
endif

"===============================
" プラグイン設定
"===============================
if filereadable(expand('~/.vimPlugin.vim'))
  source ~/.vimPlugin.vim
endif

"===============================
" カラー設定
"===============================
if filereadable(expand('~/.vimColor.vim'))
  source ~/.vimColor.vim
endif

"===============================
" キーマッピング設定を読み込む
"===============================
if filereadable(expand('~/.vimKeymap.vim'))
  source ~/.vimKeymap.vim
endif

