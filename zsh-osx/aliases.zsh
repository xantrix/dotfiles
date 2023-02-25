# check for conflicts with https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/common-aliases

# https://github.com/ohmyzsh/ohmyzsh/issues/5243
#bad: alias reload='source ~/.zshrc' use exec zsh (or: omz reload)
alias reload='omz reload'

# ibrew https://diewland.medium.com/how-to-install-python-3-7-on-macbook-m1-87c5b0fcb3b5
# https://stackoverflow.com/questions/70315418/installing-python3-7-macbook-air-m1-problem
alias ibrew="arch -x86_64 /usr/local/bin/brew"
# usage: ibrew install python@3.7

# etc...
alias v='vim'

# kubectl
# alias G="| grep" (not supported in bash)
# export do="-oyaml --dry-run=client" (doesn't work)

# alias kns="k config view | grep namespace"
# alias kcns='kubectl config set-context $(kubectl config current-context) --namespace'
# alias kg="k get"
# alias kd="k describe"
# alias kc="k create"
# alias ke="k edit"

# from plugings
# alias kdel="kubectl delete"
# alias keti="kubectl exec -ti"
# alias kl="kubectl logs"
# alias klf="kubectl logs -f"
# https://github.com/ahmetb/kubectl-aliases

# see: dynamic kubeconfig
# klogin(){
#     #set -x
#     kcgen
#     cat ~/.kube/$1 > $KUBECONFIG
# }

# kcecho(){
#     echo $KUBECONFIG
#     cat $KUBECONFIG
# }

# kcgen(){
#     echo "Gen new KUBECONFIG file in /tmp"
#     export KUBECONFIG=$(mktemp -t "kubeconfig")
#     ls $KUBECONFIG
# }

# kcdel(){
#     echo "Delete KUBECONFIG file"
#     rm -f $KUBECONFIG
# }

