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

create_link .bash_profile
create_link .bashrc
create_link .bashrcImg
create_link .bashrcAliases
create_link .bashrcLinux

create_link .gitconfig

create_link .vimrc
create_link .vimrcInit.vim
create_link .vimrcColor.vim
create_link .vimrcCheat.md
create_link .vimrcPlugin.vim
create_link .vimrcKeymap.vim


source ~/.bashrc

