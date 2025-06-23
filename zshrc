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
plugins=(git sudo vi-mode)

source $ZSH/oh-my-zsh.sh

DEFAULT_USER=`whoami`


# Environment Setup
source ~/.zsh_aliases
export VISUAL=vim
export EDITOR="$VISUAL"
export LC_COLLATE=C

# Include local bin directory in the path
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi


export FZF_DEFAULT_COMMAND='fd --type f --exclude .git'
export FZF_DEFAULT_OPTS='--height 50% --layout reverse --border rounded'


# Reenable reverse history search (would otherwise be disabled by vi-mode)
bindkey ^R history-incremental-search-backward

n()
{
    # Block nesting of nnn in subshells
    [ "${NNNLVL:-0}" -eq 0 ] || {
        echo "nnn is already running"
        return
    }

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # If NNN_TMPFILE is set to a custom path, it must be exported for nnn to
    # see. To cd on quit only on ^G, remove the "export" and make sure not to
    # use a custom path, i.e. set NNN_TMPFILE *exactly* as follows:
    #      NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    # The command builtin allows one to alias nnn to n, if desired, without
    # making an infinitely recursive alias
    command nnn "$@"

    [ ! -f "$NNN_TMPFILE" ] || {
        . "$NNN_TMPFILE"
        rm -f -- "$NNN_TMPFILE" > /dev/null
    }
}
# 'A' stops auto-entering a folder on unique match
export NNN_OPTS='A'

if [ -f "/proc/sys/fs/binfmt_misc/WSLInterop" ] ; then
# Windows only
    export NNN_PLUG='d:-explore_dir;o:-!&explorer.exe $nnn'
else
    export NNN_PLUG='d:dragdrop'
fi


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
