"===============================
" vimキーマッピング
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

" visual modeの移動はshift押しながら
vnoremap <S-Down>  gj
vnoremap <S-Up>    gk
vnoremap <S-Left>  <Left>
vnoremap <S-Right> <Right>

" visual modeを解除して移動
" vnoremap <Up>    <ESC><Up>
" vnoremap <Left>  <ESC><Left>
" vnoremap <Right> <ESC><Right>
" vnoremap <Down>  <ESC><Down>

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
au FileType python nnoremap <C-l> :Autopep8<CR>
au FileType markdown nnoremap <C-l> ggvG$:'<,'>Alignta \|<CR>
au FileType gitcommit nnoremap <C-l> V:s/^#\t//g<CR>:s/ \+/ /g<CR>:noh<CR>

"enterで整形設定に行くようにする
vnoremap <Enter> <Plug>(EasyAlign)

" クリップボード作業
nnoremap <space>c "+y
nnoremap <space>x "+d
vnoremap <space>c "+y
vnoremap <space>x "+d
nnoremap <space>v "+P
inoremap <space>v <C-r>+

" set formatoptions-=ro
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
" nnoremap d "+d
nnoremap <Bs> X

" 行削除
nnoremap <C-y> dd
inoremap <C-y> <Esc>dd

"===============================
" 特殊コマンド
"===============================

" 保存(terminalによって動いたり動かなかったり)
" nnoremap <C-s> :w<CR>:echo '保存しました☆彡'<CR>
" inoremap <C-s> <Esc>:w<CR>:echo '保存しました☆彡'<CR>


" jjでesc
inoremap jj <Esc>

" .vimrc再読込
" nnoremap <C-@> :source ~/.vimrc<CR>:noh<CR>:call dein#update()<CR>:echo '.vimrcを読み込みましたよ★'<CR>

" ハイライトを消す
nnoremap <f3> :noh<CR>

" 画面端で折り返すか切り替え
nnoremap <leader>z :set wrap<CR>
nnoremap <leader>x :set nowrap<CR>

" プロジェクトツリー表示(プラグイン)
" nnoremap <leader>b :NERDTree<CR>
nnoremap <silent><leader>b :NERDTreeToggle<CR>
nnoremap <silent><leader>b :NERDTreeToggle<CR>


" タブを切り替える
nmap <leader>t <Plug>AirlineSelectNextTab
nmap <space>t <Plug>AirlineSelectNextTab
nmap tt <Plug>AirlineSelectNextTab
" nmap <C-n> <Plug>AirlineSelectNextTab

" ウインドウを切り替える
nnoremap <leader>w <C-w>w
nnoremap <space>w <C-w>w

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
vnoremap <space>h :s///gc<Left><Left><Left><Left>

" 戻る進む
nnoremap <A-left> <C-o>
nnoremap <A-right> <C-i>

