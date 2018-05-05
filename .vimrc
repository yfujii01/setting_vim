"===============================
"起動時設定
"===============================
" 構文毎に文字色を変化させる
syntax on

"エディター色
"colorscheme murphy
colorscheme desert

"エンコード
set fileencodings=utf-8,sjis,iso-2022-jp,euc-jp

"行番号
set number

" 行番号の色
highlight LineNr ctermfg=darkyellow

"タブの間隔
set tabstop=4

" 検索結果をハイライト
set hlsearch

" スワップファイルは使わない
set noswapfile

" コマンドラインに使われる画面上の行数
"set cmdheight=2

" エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
set laststatus=2

" ステータス行に表示させる情報の指定
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

""""""""""""""""""""""""""""""
" 挿入モード時、ステータスラインの色を変更
""""""""""""""""""""""""""""""
let g:hi_insert = 'highlight StatusLine guifg=darkblue guibg=darkyellow gui=none ctermfg=blue ctermbg=yellow cterm=none'

if has('syntax')
  augroup InsertHook
    autocmd!
    autocmd InsertEnter * call s:StatusLine('Enter')
    autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif

let s:slhlcmd = ''
function! s:StatusLine(mode)
  if a:mode == 'Enter'
    silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    silent exec g:hi_insert
  else
    highlight clear StatusLine
    silent exec s:slhlcmd
  endif
endfunction

function! s:GetHighlight(hi)
  redir => hl
  exec 'highlight '.a:hi
  redir END
  let hl = substitute(hl, '[\r\n]', '', 'g')
  let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction

" コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set wildmenu

" 入力中のコマンドを表示する
set showcmd



"===============================
"独自キーマッピング
"===============================
"----
"noremap(ノーマルモード＋ビジュアルモード)
"----
noremap j gj
noremap k gk

"----
"nnoremap(ノーマルモード)
"----
"検索結果ハイライトを消す
nnoremap <F3> :noh<CR>
nnoremap <Down> gj
nnoremap <Up>   gk


"===============================
"myhelp
"===============================
helptags $HOME/.vim/doc/
"
"使い方
":help myhelp
"
"設定方法
"~/.vim/doc/myhelp.txt
"----
"*myhelp.txt*
" 
" ジャンプ <CTRL-]>
" ・
" ・
" ・
"----


"===============================
"start dein SetUp Memo
"===============================
" cd ~
" mkdir ~/.cache
" mkdir ~/.cache/dein
" cd .cache/dein/
" wget https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh
" sh ./installer.sh ~/.cache/dein/
"
" cd ~/.cache/
" mkdir userconfig
" cd userconfig/
"
" vim plugin.toml
"```
" plugin.toml
" [[plugins]]
"  repo = 'Shougo/dein.vim'
" 
" [[plugins]]
" repo = 'Shougo/vimproc.vim'
"```
"
" vim plugin_lazy.toml
"```
" plugin_lazy.toml
" [[plugins]]
" repo   = 'Shougo/unite.vim'
" 
" [[plugins]]
" repo      = 'Shougo/neomru.vim'
" on_source = ['unite.vim']
" 
" [[plugins]]
" repo = "davidhalter/jedi-vim"
" on_ft = ['python']
"```



"===============================
"dein Scripts
"===============================
if &compatible
  set nocompatible               " Be iMproved
endif

let s:dein_path = expand('~/.cache/dein')
let s:dein_repo_path = s:dein_path . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_path)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_path
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_path, ':p')
endif

if dein#load_state(s:dein_path)
  call dein#begin(s:dein_path)

  let g:config_dir  = expand('~/.cache/userconfig')
  let s:toml        = g:config_dir . '/plugin.toml'
  let s:lazy_toml   = g:config_dir . '/plugin_lazy.toml'

  " TOML 読み込み
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif


" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif



"===============================
"プラグインオプション
"===============================
"vimを立ち上げたときに、自動的にvim-indent-guidesをオンにする
" nathanaelkane/vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1



"ステータス行に現在のgitブランチを表示する
" tpope/vim-fugitive
set statusline+=%{fugitive#statusline()}
