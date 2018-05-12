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
create_link .bash_profile
create_link .bashrc

create_link .gitconfig

create_link .vim_cheatsheet.md
create_link .vim_dein_lazy.toml
create_link .vim_dein.toml
create_link .vimrc
