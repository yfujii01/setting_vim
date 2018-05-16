#!/bin/bash

function create_link () {
	file=${1}
    if [ -f ~/${file} ]; then 
		rm ~/${file}
		echo 'rm ~\'${file}
	fi
	ln ${file} ~/${file}
	echo 'link create ~/'${file}
}

function create_link2 () {
	file=${1}
	dir=${2}

    if [ ! -d ${dir} ]; then
		mkdir -p ${dir}
		echo 'mkdir -p '${dir}
	fi

    if [ -f ${dir}/${file} ]; then 
		rm ${dir}/${file}
		echo 'rm '${dir}'\'${file}
	fi
	ln ${file} ${dir}/${file}
	echo 'link create '${dir}'/'${file}
}

create_link .vimrc
create_link .vimrcInit.vim
create_link .vimrcColor.vim
create_link .vimrcCheat.md
create_link .vimrcPlugin.vim
create_link .vimrcKeymap.vim
create_link .vimPlugin.toml
create_link .vimLazy.toml
create_link2 vimAfterSetting.vim ~/.vim/after/plugin
