unsetopt BEEP

ZVM_INIT_MODE=sourcing
source $HOME/.zsh-plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

if [ -n "${commands[fzf-share]}" ]; then
	source "$(fzf-share)/key-bindings.zsh"
	source "$(fzf-share)/completion.zsh"
fi

eval "$(oh-my-posh init zsh --config $HOME/.nix-profile/share/oh-my-posh/themes/tokyonight_storm.omp.json)"
