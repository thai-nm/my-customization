autoload -Uz compinit
compinit

NEWLINE=$'\n'
PROMPT="%F{#fbfaa2}${ZSH_NAME}${ZSH_VERSION}%f%b %~ ${NEWLINE}$ "

# Path to Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

plugins=(
    git
    zsh-autosuggestions
    # zsh-syntax-highlighting
)

# Manage PATHs
# path+=('/some/path')
# export PATH

DISABLE_AUTO_UPDATE="true"
source $ZSH/oh-my-zsh.sh

# Misc
alias ll="ls -la"

# Git alias
alias gst="git status"
alias gcm="git commit -m"
alias gadd="git add"

# Kubernetes
alias k="kubectl"
alias kn="k config set-context --current --namespace"
alias kg="k get"
alias kgp="k get pod"
alias kd="k describe"
alias kdp="k describe pod"

# Workplace
alias wplace="cd $HOME/workplace"
alias psn="cd $HOME/workplace/personal"
alias pstudios="cd $HOME/workplace/playstudios"

export HOMEBREW_NO_AUTO_UPDATE=1

source <(kubectl completion zsh)
