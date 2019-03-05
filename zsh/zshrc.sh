#!/bin/sh

export ZSH="~/.oh-my-zsh"

#ZSH_THEME="custom"
ZSH_THEME="agnoster"

plugins=( git docker yarn tmux exec-time)
source ${ZSH}/oh-my-zsh.sh
