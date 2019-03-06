#!/usr/bin/env bash

source $(dirname $0)/../util.sh

# Install
if binexists tmux; then
    printf "tmux installed\n"
else
    printf "tmux not installed\n"
    prompt_yn "Install tmux?" && install_package tmux || interrupt_setup
fi
printf 'source ~/dotfiles/tmux/tmux.conf\n' > ~/.tmux.conf
