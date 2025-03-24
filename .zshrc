# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""

# Add wisely, as too many plugins slow down shell startup.
plugins=( git zsh-autosuggestions zsh-syntax-highlighting you-should-use alias-finder )

# alias-finder
zstyle ':omz:plugins:alias-finder' autoload yes # disabled by default
# zstyle ':omz:plugins:alias-finder' longer yes # disabled by default
zstyle ':omz:plugins:alias-finder' exact yes # disabled by default
zstyle ':omz:plugins:alias-finder' cheaper yes # disabled by default

source $ZSH/oh-my-zsh.sh

# Custom aliases are in .oh-my-zsh/custom/aliases.zsh

# Function to change the current working directory when exiting Yazi
function y() {
    local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
    yazi "$@" --cwd-file="$tmp"
    if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        builtin cd -- "$cwd"
    fi
    rm -f -- "$tmp"
}

# Flutter
export PATH="$HOME/Tools/flutter/bin:$PATH"

# Zoxide
eval "$(zoxide init zsh)"

# Zsh theme
source ~/.powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

fastfetch
