#!/bin/sh

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=${ZSH_THEME:-custom}

plugins=( git docker yarn tmux exec-time yarn-autocompletions)
source ${ZSH}/oh-my-zsh.sh
