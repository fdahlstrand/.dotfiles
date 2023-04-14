#!/bin/sh

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

if ! [ -x "$(command -v git)" ]; then
    nix-env -iA git
fi

if ! [ -d "./.git" ]; then
    git clone git@github.com:fdahlstrand/.dotfiles.git tmp
    mv tmp/* tmp/.* .
fi
