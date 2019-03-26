#!/bin/sh

source $(dirname $0)/../util.sh

# Install
if binexists vim; then
    printf "vim installed\n"
else
    printf "vim not installed\n"
    prompt_yn "Install vim?" && install_package vim || interrupt_setup
fi

printf 'so ~/dotfiles/vim/vimrc.vim\n' > ~/.vimrc
