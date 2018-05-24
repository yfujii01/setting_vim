
"===============================
"起動時設定(標準機能)
"===============================
"エンコード
set encoding=utf-8
set fileencodings=utf-8,sjis,iso-2022-jp,euc-jp

"方向キーでの移動をオン
set nocompatible

"マルチバイトの文字を崩れずに表示
set ambiwidth=double

"行番号
set number

"タブの間隔
set tabstop=4

"インデント幅をスペース4つ分にする
set shiftwidth=4

" 行末のスペースを可視化
" set list
" set listchars=eol:\ ,trail:-
" set listchars=tab;\ \ ,eol:\ ,trail:-

" "タブ、空白、改行の可視化
" set list
" set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%
"
" "全角スペースをハイライト表示
" function! ZenkakuSpace()
"     highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
" endfunction
"
" if has('syntax')
"     augroup ZenkakuSpace
"         autocmd!
"         autocmd ColorScheme       * call ZenkakuSpace()
"         autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
"     augroup END
"     call ZenkakuSpace()
" endif
"

" 新しいウィンドウを下に開く
set splitbelow
" 新しいウィンドウを右に開く
set splitright

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
" set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']'.'[改行='.&ff.']'.'[filetype='.&filetype.']'}%=%l,%c%V%8P


" yank時にclipboard領域にも設定する
" set clipboard=unnamedplus
" 標準のyankとclipboard設定を使う
set clipboard=
" set
" clipboard&
" set clipboard^=unnamedplus

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

" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore

set formatoptions-=ro

" au FileType * setlocal formatoptions-=ro

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

" キーコードシーケンスが終了するのを待つ時間を短くする。
set ttimeoutlen=10

