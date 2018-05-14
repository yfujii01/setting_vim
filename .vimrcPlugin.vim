"===============================
" プラグイン設定
"===============================
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

  call dein#add('Shougo/dein.vim')
  " call dein#add('Shougo/vimproc.vim')
  " call dein#add('nathanaelkane/vim-indent-guides')        " インデントに色を付けて見やすくする
  call dein#add('tpope/vim-fugitive')                       " ステータス行に現在のgitブランチを表示する
  call dein#add('tomtom/tcomment_vim')                      " コメントON/OFFを手軽に実行
  " call dein#add('scrooloose/nerdtree')                      " プロジェクトツリーを表示する
  " call dein#add('reireias/vim-cheatsheet')                  " 自分用チートシートを表示する(:Cheat)
  call dein#add('terryma/vim-multiple-cursors')             " マルチカーソル
  call dein#add('deris/vim-rengbang')                       " 連番作成
  call dein#add('h1mesuke/vim-alignta')                     " フォーマット
  call dein#add('gosukiwi/vim-atom-dark')                   " カラースキーマ
  call dein#add('vim-scripts/vim-auto-save')                " 自動保存

  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/neomru.vim',{'on_source': 'unite.vim'})
  call dein#add('Shougo/vimfiler')
  " call dein#add('Shougo/vimfiler',{'on_source': 'unite.vim'})
  call dein#add('tell-k/vim-autopep8',{'on_ft': 'python'})  " 構文チェック
  call dein#add('cespare/vim-toml',{'on_ft': 'toml'})
  call dein#add('davidhalter/jedi-vim',{'on_ft': 'python'}) " python jedi

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
" インデントに色を付けて見やすくする
" ここより前に色設定を変えていると反映されないことがある
" nathanaelkane/vim-indent-guides
" let g:indent_guides_enable_on_vim_startup = 1

" ファイラーをデフォルトで表示
let g:vimfiler_as_default_explorer = 1

"現在開いているバッファをIDE風に開く
nnoremap <silent> <Leader>fi :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit<CR>
if has('vim_starting')
autocmd VimEnter * VimFilerBufferDir -split -simple -winwidth=35 -no-quit | call s:MoveToFileAtStart()
endif
function! s:MoveToFileAtStart()
  call feedkeys(".")
  call feedkeys("\<C-w>")
  call feedkeys("\<C-w>")
  " call feedkeys("\s")
  " call feedkeys("\l")
endfunction

" eで新規タブとして開く
" let g:vimfiler_edit_action = 'tabopen'

" gitを便利に使う
" ステータス行に現在のgitブランチを表示する 	
" 'tpope/vim-fugitive'
set statusline+=%{fugitive#statusline()}

" プロジェクトツリーを表示する
" 'scrooloose/nerdtree'
" 隠しファイルをデフォルトで表示
" let NERDTreeShowHidden = 1

" 自分用チートシートを表示する(:Cheat)
" 'reireias/vim-cheatsheet'
" let g:cheatsheet#cheat_file = '~/.vimCheat.md'

" # マルチカーソル
" 'terryma/vim-multiple-cursors'
let g:multi_cursor_select_all_key      = '<f2>'

" 自動保存を有効にする
" 'vim-scripts/vim-auto-save'
" let g:auto_save = 1
" let g:auto_save_silent = 1

