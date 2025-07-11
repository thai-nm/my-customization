set -U fish_color_command white

if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
    echo (last $USER | head -n 1 | awk '{print "Last login:", $4, $5, $6, $7, "as", $1}')
end

function fish_prompt
    set_color 99cc99
    set_color fbfaa2

    echo -n "fish$FISH_VERSION "

    set_color normal

    echo (prompt_pwd)

    echo -n "\$ "
    
    # Reset color to default
    set_color normal
end

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
alias bi="cd $HOME/workplace/brightinsight"
alias psn="cd $HOME/workplace/personal"
alias zp="cd $HOME/workplace/zuellig-pharma"
