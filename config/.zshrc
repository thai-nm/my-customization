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

source $ZSH/oh-my-zsh.sh

# Misc
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias bat="batcat"
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
alias kgpn="k get pod -n"
alias kdp="k describe pod"
alias kdpn="k describe pod -n"
alias kgsvc="k get service"
alias kgsvcn="k get service -n"
alias kgd="k get deployment"
alias kgdn="k get deployment -n"

# Workplace
alias wplace="cd $HOME/workplace"
alias psn="cd $HOME/workplace/personal"