#!/usr/bin/env bash

source $(dirname $0)/../util.sh

# Install
if binexists zsh; then
    printf "zsh installed\n"
else
    printf "zsh not installed\n"
    prompt_yn "Install zsh?" && install_package zsh || (printf "Setup interrupted\n"; exit 255)
fi
