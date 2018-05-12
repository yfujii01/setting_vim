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

create_link .aa
create_link .bash_aliases
create_link .bash_linux
create_link .bash_profile
create_link .bashrc

create_link .gitconfig

create_link .vimCheat.md
create_link .vimPlugin.toml
create_link .vimLazy.toml
create_link .vimKeymap.vim
create_link .vimrc
