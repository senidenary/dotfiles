
# Oh My Zsh Options

export ZSH=/home/`whoami`/.oh-my-zsh

ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir virtualenv vcs dir_writable newline time background_jobs)
POWERLEVEL9K_DISABLE_RPROMPT=true
POWERLEVEL9K_TIME_BACKGROUND='cyan'
# See https://github.com/ryanoasis/nerd-fonts/
POWERLEVEL9K_MODE="nerdfont-complete"

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

# CUDA
export PATH=/usr/local/cuda-8.0/bin:$PATH
export CUDA_HOME=/usr/local/cuda-8.0
export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}


# Run neofetch

if command -v neofetch > /dev/null; then
    neofetch
fi

