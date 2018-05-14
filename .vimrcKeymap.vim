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
nnoremap <S-Up>     V<Up>
nnoremap <S-Down>   V<Down>
nnoremap <S-Left>   v<Left>
nnoremap <S-Right>  v<Right>
nnoremap <S-Home>   v<Home>
nnoremap <S-End>    v<End>
nnoremap <S-C-Home> v<C-Home>
nnoremap <S-C-End>  v<C-End>


"===============================
" 編集系
"===============================

" 選択行を移動
vnoremap <C-S-Up>   d<Up>P`[v`]V
vnoremap <C-S-Down> d<Down>P`[v`]V


" フォーマット(ファイルによって挙動を変える)
au FileType python nnoremap <C-l> :Autopep8<CR> 
au FileType markdown nnoremap <C-l> ggvG$:'<,'>Alignta \|<CR> 

" 下へコピー
nnoremap <C-d> yyp
vnoremap <C-d> dp`]pv`]<left>
inoremap <C-d> <Esc>yypi

" タブでインデント変更
nnoremap <Tab>   v:s/^/\t/g<CR>:noh<CR>
nnoremap <S-Tab> v:s/^\t//g<CR>
vnoremap <Tab>   :s/^/\t/g<CR>:noh<CR>gv
vnoremap <S-Tab> :s/^\t//g<CR>gv
inoremap <S-Tab> <Esc>v:s/^\t//g<CR>i

" spaceでスペースを挿入
nnoremap <Space> i <ESC><Right>

" BackSpaceで削除
nnoremap <BS>  "_X
vnoremap <BS>  "_X

" Enterで改行
nnoremap <CR> i<CR><Esc>

" 行削除(ヤンクしない)
nnoremap <C-y> "_dd
inoremap <C-y> <Esc>"_ddi

" 行移動
nnoremap <C-S-Up>   dd<Up>P
nnoremap <C-S-Down> dd<Down>P

" Endで改行コードまで選択
nnoremap <End> <End><Right>


"===============================
" 削除(基本的にヤンクさせない)
"===============================

"===============================
" 特殊コマンド
"===============================

" 保存
nnoremap <C-s> :w<CR>:echo '保存しました☆彡'<CR>
inoremap <C-s> :w<CR>:echo '保存しました☆彡'<CR>

" 置換
nnoremap <C-h> :%s///g<Left><Left><Left>
vnoremap <C-h> :s///g<Left><Left><Left>

" 削除キーでyankしない
nnoremap x "_x
nnoremap X "_X
nnoremap d "_d
nnoremap D "_D

" ctrl+vでvisual矩形へ
inoremap <C-v> <ESC><Right><C-v>

" jjでesc
inoremap jj <Esc>

" .vimrc再読込
nnoremap <C-@> :source ~/.vimrc<CR>:noh<CR>:echo '.vimrcを読み込みました★'<CR>

" ハイライトを消す
nnoremap <f3> :noh<CR>

" 画面端で折り返すか切り替え
nnoremap <leader>z :set wrap<CR>
nnoremap <leader>x :set nowrap<CR>

" プロジェクトツリー表示(プラグイン)
nnoremap <leader>b :NERDTree<CR>


