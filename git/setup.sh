#!/usr/bin/env bash

NAME=$(git config --global 'user.name')
if test -z "${NAME}"; then
    NAME=$(getent passwd ${USER} | cut -d':' -f5 | cut -d',' -f1)
    if test -z "${NAME}"; then
        NAME=${USER}
    fi
fi

EMAIL=$(git config --global 'user.email');
if test -z "${EMAIL}"; then
 EMAIL="${USER}@gmail.com"
fi

cat ~/dotfiles/git/config.ini > ~/.gitconfig
cat ~/dotfiles/git/ignore/* > ~/.gitignore
git config --global user.name "${NAME}"
git config --global user.email "${EMAIL}"


printf "[git]\tUser ${NAME} <${EMAIL}> was configured\n"
