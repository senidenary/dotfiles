# Run neofetch
if command -v fastfetch > /dev/null; then
    fastfetch
fi


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.antidote/antidote.zsh
antidote load

# Highlight options during tab completion
zstyle ':completion:*' menu select

# Environment Setup
source ~/.zsh_aliases
export VISUAL=hx
export EDITOR="$VISUAL"
export LC_COLLATE=C

HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history
setopt HIST_IGNORE_SPACE

setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS

# Include local bin directory in the path
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi


export FZF_DEFAULT_COMMAND='fd --type f --exclude .git'
export FZF_DEFAULT_OPTS='--height 50% --layout reverse --border rounded ---cycle'


# Reenable reverse history search (would otherwise be disabled by vi-mode)
bindkey ^R history-incremental-search-backward


if type zoxide > /dev/null; then
    eval "$(zoxide init zsh)"
fi

lfcd() {
    cd $(command lf --print-last-dir "$@")
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
