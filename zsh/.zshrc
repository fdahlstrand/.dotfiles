unsetopt BEEP

bindkey -v
source $HOME/.zsh-plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

eval "$(oh-my-posh init zsh --config $HOME/.nix-profile/share/oh-my-posh/themes/tokyonight_storm.omp.json)"
