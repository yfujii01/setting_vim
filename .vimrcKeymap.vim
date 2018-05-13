"===============================
" vimキーマッピング
"===============================
"------------------------------------------------------------
" ノーマルモード＆ビジュアルモード
"------------------------------------------------------------
" 上下移動を表示に合わせる
noremap j gj
noremap k gk
nnoremap <Down> gj
nnoremap <Up>   gk

"------------------------------------------------------------
" ノーマルモード
"------------------------------------------------------------

" BackSpaceで削除
nnoremap <BS>  "_X

" spaceでスペースを挿入
nnoremap <Space> i <ESC><Right>

" 削除キーでyankしない
nnoremap x "_x
nnoremap X "_X
nnoremap d "_d
nnoremap D "_D

" Enterで改行
nnoremap <CR> i<CR><Esc>

" 行削除(ヤンクしない)
nnoremap <C-y> "_dd

" 行移動
nnoremap <C-S-Up> dd<Up>P
nnoremap <C-S-Down> dd<Down>P

" .vimrc再読込
nnoremap <leader>r :source ~/.vimrc<CR>

" ハイライトを消す
nnoremap <f3> :noh<CR>

" 画面端で折り返すか切り替え
nnoremap <leader>z :set wrap<CR>
nnoremap <leader>x :set nowrap<CR>

" プロジェクトツリー表示(プラグイン)
nnoremap <leader>b :NERDTree<CR>

" Shift+キーでvisualモード開始
nnoremap <S-Up> $v^<Up>
nnoremap <S-Left> v<Left>
nnoremap <S-Right> v<Right>
nnoremap <S-Down> ^v$<Down>
nnoremap <S-Home> v<Home>
nnoremap <S-End> v<End>
nnoremap <S-C-Home> v<C-Home>
nnoremap <S-C-End> v<C-End>

" Endで改行コードまで選択
nnoremap <End> <End><Right>

" スクロール
nnoremap <C-Up> <C-y>
nnoremap <C-Down> <C-e>

" 全選択
nnoremap <C-a> ggvG$

" 置換
nnoremap <C-h> :%s///g<Left><Left>

" フォーマット(ファイルによって挙動を変える)
au FileType python nnoremap <C-l> :Autopep8<CR> 
au FileType markdown nnoremap <C-l> ggvG$:'<,'>Alignta \|<CR> 

" 下へコピー
nnoremap <C-d> yy<Down>P
vnoremap <C-d> dp`]pv`]<left>

" Tabでインデント挿入
nnoremap <Tab> i<Tab><Esc>

"------------------------------------------------------------
" ビジュアルモード
"------------------------------------------------------------
" Shift+方向キーは移動
vnoremap <S-Up> <Up>
vnoremap <S-Left> <Left>
vnoremap <S-Right> <Right>
vnoremap <S-Down> <Down>

" 方向キーはvisual modeを解除して移動
vnoremap <Up> <ESC><Up>
vnoremap <Left> <ESC><Left>
vnoremap <Right> <ESC><Right>
vnoremap <Down> <ESC><Down>

" タブでインデント変更
vnoremap <Tab> :s/^/\t/g<CR>:noh<CR>gv
vnoremap <S-Tab> :s/^\t//g<CR>gv

" 行移動
vnoremap <C-S-Up> d<Up>P`[v`]<Left>
vnoremap <C-S-Down> d<Down>P`[v`]<Left>

"------------------------------------------------------------
" inoremap(インサートモード)
"------------------------------------------------------------
inoremap <S-Up> <ESC>$v^<Up>
inoremap <S-Left> <ESC>v<Left>
inoremap <S-Right> <ESC>v<Right>
inoremap <S-Down> <ESC>^v$<Down>

" ctrl+vでvisual矩形へ
inoremap <C-v> <ESC><Right><C-v>

" jjでesc
inoremap jj <Esc>

