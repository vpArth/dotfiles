#!/usr/bin/env bash

source $(dirname $0)/../util.sh

# Install
if binexists zsh; then
    printf "zsh installed\n"
else
    printf "zsh not installed\n"
    prompt_yn "Install zsh?" && install_package zsh || interrupt_setup
fi

# Check zsh is default
if isshell zsh; then
    printf "zsh is default shell\n"
else
    printf "${SHELL} is default shell\n"
    prompt_yn "Change default shell to zsh?" && chsh -s $(which zsh) || interrupt_setup
fi
