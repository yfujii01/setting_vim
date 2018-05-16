#!/bin/bash

# 展開する(ハードリンク)
# 引数1:ファイル名
# 引数2:展開先ディレクトリ
function create_link () {
	file=${1}
	dir=${2}

    if [ ! -d ${dir} ]; then
		mkdir -p ${dir}
		echo 'mkdir -p '${dir}
	fi

	ln -f ${file} ${dir}/${file}
	echo 'link create '${dir}'/'${file}
}

create_link .vimrc ~
create_link .vimrcInit.vim ~
create_link .vimrcColor.vim ~
create_link .vimrcCheat.md ~
create_link .vimrcPlugin.vim ~
create_link .vimrcKeymap.vim ~
create_link .vimPlugin.toml ~
create_link .vimLazy.toml ~
create_link vimAfterSetting.vim ~/.vim/after/plugin
