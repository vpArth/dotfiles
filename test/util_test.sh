#!/usr/bin/env bash

source $(dirname $0)/../util.sh

printf "binexists: "
binexists sudo && printf . || printf F
binexists $(cat /dev/urandom | tr -cd 'a-f0-9' | head -c 10) && printf F || printf .
printf "\n"

printf "isshell: "
isshell $SHELL && printf . || printf F
isshell somesh && printf F || printf .
isshell nologin && printf F || printf .
printf "\n"

printf "prompt_yn: "
echo y | prompt_yn 'Positive' 2> /dev/null && printf . || printf F
echo n | prompt_yn 'Negative' 2> /dev/null && printf F || printf .
echo wrong | prompt_yn 'Wrong' 2> /dev/null && printf F || printf .
printf "\n"

