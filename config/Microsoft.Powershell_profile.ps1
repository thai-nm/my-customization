# Auto-complete
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Aliases
function ll { ls -la }

# Git aliases
function gst { git status }
function gcm { git commit -m $args }
function gadd { git add $args }

# Kubernetes aliases
function k { kubectl $args }
function kn { kubectl config set-context --current --namespace $args }
function kg { kubectl get $args }
function kgp { kubectl get pod $args }
function kgpn { kubectl get pod -n $args }
function kdp { kubectl describe pod $args }
function kdpn { kubectl describe pod -n $args }
function kgsvc { kubectl get service $args }
function kgsvcn { kubectl get service -n $args }
function kgd { kubectl get deployment $args }
function kgdn { kubectl get deployment -n $args }

# Workplace aliases
function wplace { Set-Location "$HOME/workplace" }
function psn { Set-Location "$HOME/workplace/personal" }

fnm env --use-on-cd --shell powershell | Out-String | Invoke-Expression
