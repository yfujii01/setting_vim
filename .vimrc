
"===============================
"起動時設定(標準機能)
"===============================
"エンコード
set encoding=utf-8
set fileencodings=utf-8,sjis,iso-2022-jp,euc-jp

"マルチバイトの文字を崩れずに表示
set ambiwidth=double

"行番号
set number

"タブの間隔
set tabstop=4

" 行末のスペースを可視化
" set list
" set listchars=eol:\ ,trail:-
" set listchars=tab;\ \ ,eol:\ ,trail:-

"タブ、空白、改行の可視化
set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%

"全角スペースをハイライト表示
function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
endfunction
   
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme       * call ZenkakuSpace()
        autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
    augroup END
    call ZenkakuSpace()
endif



"前回のカーソル位置を復元
augroup vimrcEx
  au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
  \ exe "normal g`\"" | endif
augroup END

" 画面端で折り返しはしないをデフォルトにする
set nowrap

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
" if has('mouse')
"     set mouse=a
"     if has('mouse_sgr')
"         set ttymouse=sgr
"     elseif v:version > 703 || v:version is 703 && has('patch632')
"         set ttymouse=sgr
"     else
"         set ttymouse=xterm2
"     endif
" endif


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

  let s:toml        = '~/.vimPlugin.toml'
  let s:lazy_toml   = '~/.vimLazy.toml'

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
"プラグイン設定
"===============================
" インデントに色を付けて見やすくする
" ここより前に色設定を変えていると反映されないことがある
" repo = nathanaelkane/vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1


" gitを便利に使う
" ステータス行に現在のgitブランチを表示する 	
" repo = 'tpope/vim-fugitive'
set statusline+=%{fugitive#statusline()}

" プロジェクトツリーを表示する
" repo = 'scrooloose/nerdtree'
" 隠しファイルをデフォルトで表示
let NERDTreeShowHidden = 1


" 自分用チートシートを表示する(:Cheat)
" repo = 'reireias/vim-cheatsheet'
let g:cheatsheet#cheat_file = '~/.vimCheat.md'


" # マルチカーソル
" [[plugins]]
" repo = 'terryma/vim-multiple-cursors'
let g:multi_cursor_select_all_key      = '<f2>'


"===============================
"カラー設定
"===============================
" 構文毎に文字色を変化させる
syntax on

"カラースキーマ
" colorscheme desert
"colorscheme molokai
colorscheme atom-dark

" よくわからないが一度配色設定を変更後に256に戻すことで正しい256色設定になる
set t_Co=25
set t_Co=256

" vimdiffカラー設定
" :hi DiffAdd    ctermfg=black ctermbg=1
" :hi DiffChange ctermfg=black ctermbg=7
" :hi DiffDelete ctermfg=black ctermbg=7
" :hi DiffText   ctermfg=black ctermbg=1
"
" " 検索ハイライト設定
" highlight LineNr ctermfg=darkyellow
"

"===============================
" キーマッピング設定を読み込む
"===============================
if filereadable(expand('~/.vimKeymap.vim'))
  source ~/.vimKeymap.vim
endif
