"===============================
" プラグイン設定
"===============================

" ウィンドウズ用vimproc用のDLLをダウンロードする
let g:vimproc#download_windows_dll = 1

if &compatible
  set nocompatible
endif

let s:dein_path = expand('~/.cache/dein')
let s:dein_repo_path = s:dein_path . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_path)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_path
  endif
  " execute 'set runtimepath^=' . fnamemodify(s:dein_repo_path, ':p')
  execute 'set runtimepath^=' . s:dein_repo_path
endif

if dein#load_state(s:dein_path)
  call dein#begin(s:dein_path)

  let s:toml        = '~/.vimPlugin.toml'
  let s:lazy_toml   = '~/.vimLazy.toml'
  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " call dein#add('Shougo/dein.vim')
  " call dein#add('Shougo/vimproc.vim')
  " call dein#add('nathanaelkane/vim-indent-guides')        " インデントに色を付けて見やすくする
  " call dein#add('tpope/vim-fugitive')                       " ステータス行に現在のgitブランチを表示する
  " call dein#add('tomtom/tcomment_vim')                      " コメントON/OFFを手軽に実行
  " call dein#add('scrooloose/nerdtree')                      " プロジェクトツリーを表示する
  " call dein#add('reireias/vim-cheatsheet')                  " 自分用チートシートを表示する(:Cheat)
  " call dein#add('terryma/vim-multiple-cursors')             " マルチカーソル
  " call dein#add('deris/vim-rengbang')                       " 連番作成
  " call dein#add('h1mesuke/vim-alignta')                     " フォーマット
  " call dein#add('gosukiwi/vim-atom-dark')                   " カラースキーマ
  " call dein#add('vim-airline/vim-airline')                  " 
  " call dein#add('vim-airline/vim-airline-themes')           " 


"  call dein#add('Shougo/unite.vim')
"  call dein#add('Shougo/neomru.vim',{'on_source': 'unite.vim'})
"  call dein#add('Shougo/vimfiler')
"  " call dein#add('Shougo/vimfiler',{'on_source': 'unite.vim'})
"  call dein#add('tell-k/vim-autopep8',{'on_ft': 'python'})  " 構文チェック
"  call dein#add('cespare/vim-toml',{'on_ft': 'toml'})
"  call dein#add('davidhalter/jedi-vim',{'on_ft': 'python'}) " python jedi

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

"===============================
"プラグイン設定
"===============================

" # マルチカーソル
" 'terryma/vim-multiple-cursors'
" let g:multi_cursor_select_all_key      = '<f2>'


"NERDTree用隠しファイルを表示し、カーソルをファイルに移す
" function! s:MoveToFileAtStart()
"   call feedkeys("\I")
"   call feedkeys("\<C-w>")
"   call feedkeys("\w")
" endfunction
"
"vimの起動時に自動的にNERDTreeを開く(call 以降はプラスアルファ)
" autocmd vimenter * NERDTree | call s:MoveToFileAtStart()

"vimが空ファイルを開いたときにNERDTreeを自動的に開く
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

"開いている唯一のウィンドウがNERDTreeであれば閉じる
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" 隠しファイルをデフォルトで表示させる
let NERDTreeShowHidden = 1

