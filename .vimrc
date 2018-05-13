"===============================
" 起動時設定
"===============================
if filereadable(expand('~/.vimrcInit.vim'))
  source ~/.vimrcInit.vim
endif

"===============================
" プラグイン設定
"===============================
if filereadable(expand('~/.vimrcPlugin.vim'))
  source ~/.vimrcPlugin.vim
endif

"===============================
" カラー設定
"===============================
if filereadable(expand('~/.vimrcColor.vim'))
  source ~/.vimrcColor.vim
endif

"===============================
" キーマッピング設定を読み込む
"===============================
if filereadable(expand('~/.vimrcKeymap.vim'))
  source ~/.vimrcKeymap.vim
endif

