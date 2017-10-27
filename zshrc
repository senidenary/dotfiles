
# Oh My Zsh Options

export ZSH=/home/ahab/.oh-my-zsh

if showconsolefont &>/dev/null; then
    ZSH_THEME="sunaku"
else
    ZSH_THEME="powerlevel9k/powerlevel9k"
    POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir virtualenv vcs dir_writable)
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs time)
    # See https://github.com/ryanoasis/nerd-fonts/
    POWERLEVEL9K_MODE="nerdfont-complete"
fi

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

