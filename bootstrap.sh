#!/bin/bash

if ! [ -x "$(command -v nix-env)" ]; then
    sh <(curl -L https://nixos.org/nix/install) --no-daemon
fi

if ! [ -x "$(command -v git)" ]; then
    nix-env -iA git
fi

if ! [ -d "./.git" ]; then
    git clone git@github.com:fdahlstrand/.dotfiles.git tmp
    mv tmp/* tmp/.* .
fi
