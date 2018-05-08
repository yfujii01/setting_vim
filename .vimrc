"===============================
"起動時設定
"===============================
" 構文毎に文字色を変化させる
syntax on

"カラースキーマ
colorscheme desert
"colorscheme molokai

"vimを256色対応(なくても同じっぽい)
set t_Co=256


highlight LineNr ctermfg=darkyellow

"エンコード
set encoding=utf-8
set fileencodings=utf-8,sjis,iso-2022-jp,euc-jp

"マルチバイトの文字を崩れずに表示
set ambiwidth=double

"行番号
set number

"タブの間隔
set tabstop=4

" インクリメンタルサーチ. １文字入力毎に検索を行う
set incsearch 

" 検索結果をハイライト
set hlsearch
" 検索パターンに大文字小文字を区別しない
set ignorecase 
" 検索パターンに大文字を含んでいたら大文字小文字を区別する
set smartcase 

" カーソルの左右移動で行末から次の行の行頭への移動が可能になる
set whichwrap=b,s,h,l,<,>,[,],~ 

" カーソルラインをハイライト
set cursorline 

" スワップファイルは使わない
set noswapfile

" コマンドラインに使われる画面上の行数
"set cmdheight=2

" エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
set laststatus=2

" ステータス行に表示させる情報の指定
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

"クリップボードを使う
set clipboard=unnamed

" マウスの有効化
if has('mouse')
    set mouse=a
    if has('mouse_sgr')
        set ttymouse=sgr
    elseif v:version > 703 || v:version is 703 && has('patch632')
        set ttymouse=sgr
    else
        set ttymouse=xterm2
    endif
endif


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
nnoremap <Down> gj
nnoremap <Up>   gk
" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

nnoremap <leader>z :set wrap<CR>
nnoremap <leader>zz :set nowrap<CR>

nnoremap <leader>b :NERDTree<CR>



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
  " execute 'set runtimepath^=' . fnamemodify(s:dein_repo_path, ':p')
  execute 'set runtimepath^=' . s:dein_repo_path
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
