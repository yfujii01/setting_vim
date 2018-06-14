"===============================
"起動時設定
"===============================
"エンコード
set encoding=utf-8
set fileencodings=utf-8,sjis,iso-2022-jp,euc-jp,utf-16le,ucs-bom,default,latin1

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
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']'.'[改行='.&ff.']'.'[filetype='.&filetype.']'}%=%l,%c%V%8P


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

"===============================
" カラー設定
"===============================
" 構文毎に文字色を変化させる
syntax on

"カラースキーマ
colorscheme desert
"colorscheme molokai
"colorscheme atom-dark

" よくわからないが一度配色設定を変更後に256に戻すことで正しい256色設定になる
set t_Co=25
set t_Co=256

"===============================
" キーマッピング設定を読み込む
"===============================

"===============================
" 移動・選択系
"===============================

" 上下移動を表示に合わせる
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk
vnoremap j gj
vnoremap k gk
nnoremap <C-End> <C-End><Right>

" insertモードで方向キー移動するとnormalモードに戻る
" inoremap <up>      <esc><up>
" inoremap <down>    <esc><down>
" inoremap <left>    <esc><left>
" inoremap <right>   <esc><right>


" visual modeの移動はshift押しながら
vnoremap <S-Down>  gj
vnoremap <S-Up>    gk
vnoremap <S-Left>  <Left>
vnoremap <S-Right> <Right>

" visual modeを解除して移動
vnoremap <Up>    <ESC><Up>
vnoremap <Left>  <ESC><Left>
vnoremap <Right> <ESC><Right>
vnoremap <Down>  <ESC><Down>

" スクロール
nnoremap <C-Up>   <C-y>
nnoremap <C-Down> <C-e>

" 全選択
nnoremap <C-a> ggvG$

" 選択しつつビジュアルモードへ
inoremap <S-Up>     <ESC>V<Up>
inoremap <S-Down>   <ESC>V<Down>
inoremap <S-Left>   <ESC>v<Left>
inoremap <S-Right>  <ESC>v<Right>
nnoremap <S-Up>     V
nnoremap <S-Down>   V
nnoremap <S-Left>   v<Left>
nnoremap <S-Right>  v<Right>
nnoremap <S-Home>   v<Home>
nnoremap <S-End>    v<End>
nnoremap <S-C-Home> v<C-Home>
nnoremap <S-C-End>  v<C-End>

inoremap <A-Up>     <ESC><C-v><Up>
inoremap <A-Down>   <ESC><C-v><Down>
inoremap <A-Left>   <ESC><C-v><Left>
inoremap <A-Right>  <ESC><C-v><Right>

nnoremap <A-Up>     <C-v><Up>
nnoremap <A-Down>   <C-v><Down>
nnoremap <A-Left>   <C-v><Left>
nnoremap <A-Right>  <C-v><Right>
nnoremap <A-Home>   <C-v><Home>
nnoremap <A-End>    <C-v><End>
nnoremap <A-C-Home> <C-v><C-Home>
nnoremap <A-C-End>  <C-v><C-End>

"===============================
" 編集系
"===============================

" visual mode 中にIとAでまとめて編集
vnoremap <expr> I  <SID>force_blockwise_visual('I')
vnoremap <expr> A  <SID>force_blockwise_visual('A')
function! s:force_blockwise_visual(next_key)
	if mode() ==# 'v'
		return "\<C-v>" . a:next_key
	elseif mode() ==# 'V'
		return "\<C-v>0o$" . a:next_key
	else  " mode() ==# "\<C-v>"
		return a:next_key
	endif
endfunction


" 選択行を移動(yankを使用)
nnoremap <C-S-Up>   dd<Up>P
nnoremap <C-S-Down> dd<Down>P
vnoremap <C-S-Up>   d<Up>P`[v`]V
vnoremap <C-S-Down> d<Down>P`[v`]V

" フォーマット(ファイルによって挙動を変える)
function! My_format()
	echo 'フォーマットします'

	if &filetype == "python"
		call feedkeys(":Autopep8\<CR>")
	elseif &filetype == "markdown"
		call feedkeys("gg=G")
		call feedkeys(":FixWhitespace\<cr>")
		call feedkeys("\<c-o>")
		call feedkeys("\<c-o>")
		call feedkeys("ggvG$:'<,'>Alignta \|\<CR>")
	else
		call feedkeys("gg=G")
		call feedkeys(":FixWhitespace\<cr>")
		call feedkeys("\<c-o>")
		call feedkeys("\<c-o>")
	endif
endfunction
nnoremap <space>l :call My_format()<CR>

"enterで整形設定に行くようにする
vnoremap <Enter> <Plug>(EasyAlign)

" クリップボード作業
nnoremap <space>c "+y
nnoremap <space>x "+d
vnoremap <space>c "+y
vnoremap <space>x "+d
nnoremap <space>v "+P
inoremap <space>v <C-r>+

set formatoptions=
set formatoptions=cql

" 下へコピー
nnoremap <C-d> VyPgvV
vnoremap <C-d> yPgv
inoremap <C-d> <Esc>VyPgvVa

" タブでインデント変更(shift+tab時はスペースであっても消す)
nnoremap <Tab>   v:s/^/\t/g<CR>:noh<CR>
vnoremap <Tab>   :s/^/\t/g<CR>:noh<CR>gv
nnoremap <S-Tab> v:s/\(^\t\\|^ \{1,4}\)//g<CR>:noh<CR>
vnoremap <S-Tab> :s/\(^\t\\|^ \{1,4}\)//g<CR>:noh<CR>gv
inoremap <S-Tab> <Esc>v:s/\(^\t\\|^ \{1,4}\)//g<CR>:noh<CR>i

" spaceでスペースを挿入
" nnoremap <Space> i <ESC><Right>

" Enterで改行
" nnoremap <CR> i<CR><Esc>

" Endで改行コードまで選択
nnoremap <End> <End><Right>

"===============================
" 削除
"===============================
" 行削除
nnoremap <C-y> dd
inoremap <C-y> <Esc>dd

"===============================
" 特殊コマンド
"===============================
" jjでesc
inoremap jj <Esc>

" .vimrc再読込
nnoremap <space>@ :source ~/.vimrc<CR>:noh<CR>:echo '.vimrcを読み込みましたよ★'<CR>


" ハイライトを消す
nnoremap <f3> :noh<CR>

" 画面端で折り返すか切り替え
nnoremap <space>z :set wrap!<CR>

" プロジェクトツリー表示(プラグイン)
" nnoremap <leader>b :NERDTree<CR>
nnoremap <silent><leader>n :NERDTreeToggle<CR>
nnoremap <silent><space>n :NERDTreeToggle<CR>

" タブを切り替える
nnoremap tt gt

" ウインドウを切り替える
nnoremap <leader>w <C-w>w
nnoremap <space>w <C-w>w
nnoremap <tab><tab> <C-w>w


" C-Spaceを割り当てできるように
autocmd VimEnter * imap <Nul> <C-Space>

" quickrunを実行する
nnoremap <f5> :QuickRun<CR>

" quickrunを途中で止める
nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

" 検索
nnoremap <leader>f :vim  %\|cw<left><left><left><left><left>
nnoremap <space>f :vim  %\|cw<left><left><left><left><left>

" 置換
nnoremap <space>h :%s///gc<Left><Left><Left><Left>
vnoremap <space>h :s/\%V//gc<Left><Left><Left><Left>

" 戻る進む
nnoremap <A-left> <C-o>
nnoremap <A-right> <C-i>

" コメント切り替え
nnoremap <C-\> :TComment<CR><down>

" 補完
inoremap <C-space> <c-x><c-o>

" クリップボードへコピー
vnoremap <insert> "+y
