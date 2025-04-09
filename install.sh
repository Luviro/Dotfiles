#!/usr/bin/env bash

yn() {
    read -p "$1 (Y/n) " yn
    case $yn in
        [Yy]|"" ) echo proceeding... ;;
        [Nn] ) echo exiting...
            exit ;;
        * ) echo invalid choice
            yn "$1" ;;
    esac
}

zsh_setup() {
    yn "setup zsh?"
    # installing zsh
    sudo pacman -S zsh
    # installing omz
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    rm $HOME/.zshrc
    rm $HOME/.zshrc.pre-oh-my-zsh
    # powerlevel10k theme
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
    # zsh-autosuggestions plugin
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    # zsh-syntax-highlighting plugin
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    # you-should-use plugin
    git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use
}


main(){
    zsh_setup

    stow .
}

main
