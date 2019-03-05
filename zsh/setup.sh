#!/bin/sh

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

# Backup ~/.zshrc if exists
test -f ~/.zshrc && test ! -f ~/.zshrc.bak && cp ~/.zshrc ~/.zshrc.bak && printf "Old ~/.zshrc was backup as ~/.zshrc.bak\n"

# Oh-my-zsh setup
ZSH_INSTALL="https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh"
if binexists curl; then
    sh -c "$(curl -fsSL ${ZSH_INSTALL})"
elif binexists wget; then
    sh -c "$(wget ${ZSH_INSTALL} -O -)"
else
    printf "No known way to download file (curl/wget)\n"
fi

printf 'source ~/dotfiles/zsh/zshrc.sh\n' > ~/.zshrc

cp -r ~/dotfiles/zsh/themes/* ${ZSH}/custom/themes/
cp -r ~/dotfiles/zsh/plugins/* ${ZSH}/custom/plugins

exec zsh
