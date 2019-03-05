#!/usr/bin/env bash

binexists() {
    test -x "$(command -v $1)"
}

isshell() {
    test -z "${SHELL##*$1*}"
}

prompt_yn() {
    printf "$1 (y/n) " >&2
    answer=$(while ! head -c 1 | grep -i '[ny]'; do
        true;
    done)

    test -z "${answer##y*}"
}

install_package() {
    if binexists apt-get; then
        sudo apt-get install $1 -y
    elif binexists brew; then
        brew install $1
    elif binexists pkg; then
        sudo pkg install $1
    elif binexists pacman; then
        sudo pacman -S $1
    else
        printf "Can't detect package manager (Known are: apt-get, brew, pkg, pacman)\s"
    fi
}
