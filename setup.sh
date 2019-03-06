#!/usr/bin/env bash

DIR=$(dirname $0)

${DIR}/git/setup.sh
${DIR}/zsh/setup.sh
${DIR}/tmux/setup.sh

exec zsh
