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
    elif [ -x "$(command -v xwget)" ]
    then
        wget -qO- https://nixos.org/nix/install | sh -s -- --no-daemon
    else
        echo "ERROR: Need curl or wget to be able to download nix"
        exit 1
    fi
fi

ensure_nix_package git

if ! [ -d "$HOME/.dotfiles" ]; then
    git clone git@github.com:fdahlstrand/.dotfiles.git $HOME/.dotfiles
fi

ensure_nix_package stow
