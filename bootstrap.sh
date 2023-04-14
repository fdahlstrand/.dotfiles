#!/bin/bash

if ! [ -x "$(command -v nix-env)" ]; then
    sh <(curl -L https://nixos.org/nix/install) --no-daemon
fi
