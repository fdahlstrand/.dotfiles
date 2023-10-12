#!/bin/sh

ensure_nix_package() {
    if ! [ -x "$(command -v ${1})" ]; then
        nix-env -iA ${3-nixpkgs}.${2-${1}}
    fi
}

if ! [ -x "$(command -v nix-env)" ] 
then
    if [ -x "$(command -v curl)" ]
    then
        curl -L https://nixos.org/nix/install | sh -s -- --no-daemon
    elif [ -x "$(command -v wget)" ]
    then
        wget -qO- https://nixos.org/nix/install | sh -s -- --no-daemon
    else
        echo "ERROR: Need curl or wget to be able to download nix"
        exit 1
    fi
fi

ensure_nix_package git

if ! [ -d "$HOME/.dotfiles" ]; then
    git clone https://github.com/fdahlstrand/.dotfiles.git $HOME/.dotfiles
fi

if [ "$(nix-env -q | grep glibc-locales)" = "" ]; then
    nix-env -iA nixpkgs.glibcLocales
fi
ensure_nix_package stow

ensure_nix_package oh-my-posh

ensure_nix_package zsh
if [ "$(grep $(command -v zsh) /etc/shells)" = "" ]; then
    echo $(command -v zsh) | sudo tee -a /etc/shells > /dev/null
fi

if [ "$(awk -F: -v user="$USER" '$1 == user {print $NF}' /etc/passwd)" != "$(command -v zsh)" ]; then
    echo "Changing login shell, password input required"
    chsh -s $(command -v zsh)
fi

if ! [ -d $HOME/.zsh-plugins/zsh-vi-mode ]; then
    git clone https://github.com/jeffreytse/zsh-vi-mode.git $HOME/.zsh-plugins/zsh-vi-mode
fi

stow -Svt $HOME zsh

ensure_nix_package nvim neovim
ensure_nix_package rg ripgrep
ensure_nix_package fd
ensure_nix_package fzf
ensure_nix_package tmux
ensure_nix_package unzip
