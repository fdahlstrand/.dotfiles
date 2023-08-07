export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

export EDITOR="nvim"
export VISUAL="nvim"

if [ -e /home/fredrikd/.nix-profile/etc/profile.d/nix.sh ]; then 
    . /home/fredrikd/.nix-profile/etc/profile.d/nix.sh; 
fi 

export LOCALE_ARCHIVE=$(nix-env --installed --no-name --out-path --query glibc-locales)/lib/locale/locale-archive
export LANG=en_US.UTF-8
export LANGUAGE=$LANG
export LC_CTYPE="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_PAPER="en_US.UTF-8"
export LC_NAME="en_US.UTF-8"
export LC_ADDRESS="en_US.UTF-8"
export LC_TELEPHONE="en_US.UTF-8"
export LC_MEASUREMENT="en_US.UTF-8"
export LC_IDENTIFICATION="en_US.UTF-8"

export HISTFILE="$HOME/.zhistory"
export HISTSIZE=10000
export SAVEHIST=10000
. "$HOME/.cargo/env"
