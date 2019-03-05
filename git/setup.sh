#!/usr/bin/env bash

cat ~/dotfiles/git/config.ini > ~/.gitconfig
cat ~/dotfiles/git/ignore/* > ~/.gitignore

NAME=$(getent passwd ${USER} | cut -d':' -f5 | cut -d',' -f1);NAME=${NAME:-$USER};

git config --global user.name "${NAME}"
git config --global user.email "${USER}@gmail.com"
printf "[git]\tUser ${NAME} <${USER}@gmail.com> was configured\n"
