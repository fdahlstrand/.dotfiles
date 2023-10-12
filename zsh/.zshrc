unsetopt BEEP

ZVM_INIT_MODE=sourcing
source $HOME/.zsh-plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

if [ -n "${commands[fzf-share]}" ]; then
	source "$(fzf-share)/key-bindings.zsh"
	source "$(fzf-share)/completion.zsh"
fi

if [ -e $HOME/.nix-profile ]; then
	eval "$(oh-my-posh init zsh --config $HOME/.nix-profile/share/oh-my-posh/themes/tokyonight_storm.omp.json)"
else
	eval "$(oh-my-posh init zsh --config $HOME/.cache/oh-my-posh/themes/tokyonight_storm.omp.json)"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
