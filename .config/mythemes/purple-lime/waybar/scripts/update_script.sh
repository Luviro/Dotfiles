#!/usr/bin/env bash

yn() {
    read -p "$1 [Y/n] " yn
    case $yn in
        [Yy]|"" ) echo proceeding... ;;
        [Nn] ) echo exiting...
            exit ;;
        * ) echo invalid choice
            yn "$1" ;;
    esac
}

update() {
    paru -Syu
}

main() {
    yn "Update System?"
    update
}

main
