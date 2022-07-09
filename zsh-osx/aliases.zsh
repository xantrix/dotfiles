# check for conflicts with https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/common-aliases

# https://github.com/ohmyzsh/ohmyzsh/issues/5243
#bad: alias reload='source ~/.zshrc' use exec zsh (or: omz reload)
alias reload='omz reload'

# etc...
alias v='vim'

# kubectl
# alias G="| grep" (not supported in bash)
# export do="-oyaml --dry-run=client" (doesn't work)

alias kns="k config view | grep namespace"
alias kcns='kubectl config set-context $(kubectl config current-context) --namespace'
alias kg="k get"
alias kd="k describe"
alias kc="k create"

# from plugings
# alias kdel="kubectl delete"
# alias keti="kubectl exec -ti"
# alias kl="kubectl logs"
# alias klf="kubectl logs -f"
# https://github.com/ahmetb/kubectl-aliases

# see: dynamic kubeconfig
klogin(){
    #set -x
    kcgen
    cat ~/.kube/$1 > $KUBECONFIG
}

kcecho(){
    echo $KUBECONFIG
    cat $KUBECONFIG
}

kcgen(){
    echo "Gen new KUBECONFIG file in /tmp"
    export KUBECONFIG=$(mktemp -t kubeconfig.XXXXXXXX)
    ls $KUBECONFIG
}

kcdel(){
    echo "Delete KUBECONFIG file"
    rm -f $KUBECONFIG
}

# run first rancher-login()
rancher-init-configfiles(){
ADD_KUBECONFIG_FILES="$HOME/.kube"
mkdir -p "${ADD_KUBECONFIG_FILES}"
rancher cluster ls --format json | jq -r '.Cluster.name' | while read cluster; do
    rancher cluster kf $cluster > "${ADD_KUBECONFIG_FILES}/$cluster"
    echo "creating kubeconfig '${ADD_KUBECONFIG_FILES}/$cluster'"
    yq --inplace e '
    del( .users[0].user.exec.args.[] | select(. == "--user*") ) |
    .users[0].user.exec.args += ["--auth-provider=oktaProvider", "--user=foobar"]
    ' "${ADD_KUBECONFIG_FILES}/$cluster"
done
}
