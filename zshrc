# Run neofetch
if command -v neofetch > /dev/null; then
    neofetch
fi


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Oh My Zsh Options
export ZSH=/home/`whoami`/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"

CASE_SENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"
plugins=(git sudo)

source $ZSH/oh-my-zsh.sh

DEFAULT_USER=`whoami`


# Environment Setup
source ~/.zsh_aliases
export VISUAL=vim
export EDITOR="$VISUAL"


export FZF_DEFAULT_COMMAND='fdfind --type f --exclude .git'
export FZF_DEFAULT_OPTS='--height 50% --layout reverse --border'


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
