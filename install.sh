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
    # Check if zsh is installed
    if ! command -v "rofi" &> /dev/null; then
        echo -e "zsh isn't installed\ninstalling now"
        sudo pacman -S zsh
    fi
    # installing omz
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    rm $HOME/.zshrc
    # powerlevel10k theme
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
    # zsh-autosuggestions plugin
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    # zsh-syntax-highlighting plugin
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    # you-should-use plugin
    git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/you-should-use
}

move_dotfiles() {

    prev_dotfiles=$HOME/dotfiles_before_install_script

    mkdir $prev_dotfiles
    mkdir $prev_dotfiles/configs

    config_list=$'hypr\nnvim\nclipse\nyazi\nfontconfig\ncava\ngtk-3.0\nfastfetch\nkitty\nrofi\nwaybar'

    while IFS= read -r line; do

        if [ -e "$HOME/.config/$line" ]; then
            mv "$HOME/.config/$line" -t "$prev_dotfiles/configs"
        fi

    done <<< "$config_list"

    echo "move configs DONE..."

    dots_list=$'.zshrc\n.oh-my-zsh'

    while IFS= read -r line; do

        if [ -e "$HOME/$line" ]; then
            mv "$HOME/$line" -t "$prev_dotfiles"
        fi

    done <<< "$dots_list"

    echo "move dots DONE..."

}

main(){
    move_dotfiles
    zsh_setup
    stow .
}

main
