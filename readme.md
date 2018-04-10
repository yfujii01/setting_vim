# dotfiles

## デプロイ方法(linux)
mv .bash_profle dotfiles/

ln -s dotfiles/.bash_profle .bash_profle


## デプロイ方法(win)
cmdで実行
cd /d %HOMEPATH%"
del .bashrc       && mklink .bashrc       dotfiles\.bashrc      
del .bash_aliases && mklink .bash_aliases dotfiles\.bash_aliases
del .bash_profile && mklink .bash_profile dotfiles\.bash_profile
del .vimrc        && mklink .vimrc        dotfiles\.vimrc       
del .gitconfig    && mklink .gitconfig    dotfiles\.gitconfig   

## env_list
ホームフォルダ直下に作成する

パスワードなどを管理するファイル

gitでは管理しない

書き方サンプル

export SLACK_API_TOKEN=xxxxxxx-xxxxxxxxxx-xxxxxxxxxxxxxxxxxx


