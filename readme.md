# dotfiles

## デプロイ方法(linux)
mv .bash_profle dotfiles/

ln -s ~/dotfiles/.aa            ~/.aa
ln -s ~/dotfiles/.bash_profile  ~/.bash_profile
ln -s ~/dotfiles/.bash_aliases  ~/.bash_aliases
ln -s ~/dotfiles/.bashrc        ~/.bashrc
ln -s ~/dotfiles/.gitconfig     ~/.gitconfig
ln -s ~/dotfiles/.vimrc         ~/.vimrc


## vim の myhelpについて
シンボリックリンクでは読み込めないのでハードリンクを貼ること
ln myhelp.txt ~/.vim/doc/myhelp.txt


## vim の プラグインについて
.vimrcに設定方法が書いてあるので従うこと
tomlファイルについては、dotfilesで管理したいのでリンクを貼ること


## デプロイ方法(win)
cmdで実行
cd /d %HOMEPATH%"
del .aa           && mklink .aa           dotfiles\.aa      
del .bashrc       && mklink .bashrc       dotfiles\.bashrc      
del .bash_aliases && mklink .bash_aliases dotfiles\.bash_aliases
del .bash_profile && mklink .bash_profile dotfiles\.bash_profile
del .vimrc        && mklink .vimrc        dotfiles\.vimrc       
del .gitconfig    && mklink .gitconfig    dotfiles\.gitconfig   

ln .cache/userconfig/plugin.toml    ~/.cache/userconfig/plugin.toml  
ln .cache/userconfig/plugin_lazy.toml    ~/.cache/userconfig/plugin_lazy.toml
ln .vimcheatsheet.md    ~/.vimcheatsheet.md
