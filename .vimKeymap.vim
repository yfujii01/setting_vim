"===============================
"vimキーマッピング
"===============================
"------------------------------------------------------------
"ノーマルモード＆ビジュアルモード
"------------------------------------------------------------
noremap j gj
noremap k gk

"------------------------------------------------------------
"ノーマルモード
"------------------------------------------------------------
nnoremap <Down> gj
nnoremap <Up>   gk

" 削除キーでyankしない
nnoremap x "_x
nnoremap d "_d
nnoremap D "_D

" ESCキー2度押しでハイライトの切り替え
" nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

" ハイライトを消す
nnoremap <f3> :noh<CR>

" 画面端で折り返すか切り替え
nnoremap <leader>z :set wrap<CR>
nnoremap <leader>x :set nowrap<CR>

" プロジェクトツリー表示(プラグイン)
nnoremap <leader>b :NERDTree<CR>

" Shift+方向キーでvisualモード開始
nnoremap <S-Up> v<Up>
nnoremap <S-Left> v<Left>
nnoremap <S-Right> v<Right>
nnoremap <S-Down> v<Down>

" スクロール
nnoremap <C-Up> <C-y>
nnoremap <C-Down> <C-e>

" 全選択
nnoremap <C-a> ggvG$

"------------------------------------------------------------
"ビジュアルモード
"------------------------------------------------------------
" Shift+方向キーは移動
vnoremap <S-Up> <Up>
vnoremap <S-Left> <Left>
vnoremap <S-Right> <Right>
vnoremap <S-Down> <Down>


"------------------------------------------------------------
"inoremap(インサートモード)
"------------------------------------------------------------
inoremap <S-Up> <ESC>v<Up>
inoremap <S-Left> <ESC>v<Left>
inoremap <S-Right> <ESC>v<Right>
inoremap <S-Down> <ESC>v<Down>

