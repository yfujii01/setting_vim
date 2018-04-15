# dotfiles

## デプロイ方法(linux)
mv .bash_profle dotfiles/

ln -s ~/dotfiles/.aa            ~/.aa
ln -s ~/dotfiles/.bash_profile  ~/.bash_profile
ln -s ~/dotfiles/.bash_aliases  ~/.bash_aliases
ln -s ~/dotfiles/.bashrc        ~/.bashrc
ln -s ~/dotfiles/.gitconfig     ~/.gitconfig
ln -s ~/dotfiles/.vimrc         ~/.vimrc
sudo ln -s ~/dotfiles/rc.local  /etc/rc.local

## デプロイ方法(win)
cmdで実行
cd /d %HOMEPATH%"
del .aa           && mklink .aa           dotfiles\.aa      
del .bashrc       && mklink .bashrc       dotfiles\.bashrc      
del .bash_aliases && mklink .bash_aliases dotfiles\.bash_aliases
del .bash_profile && mklink .bash_profile dotfiles\.bash_profile
del .vimrc        && mklink .vimrc        dotfiles\.vimrc       
del .gitconfig    && mklink .gitconfig    dotfiles\.gitconfig   
