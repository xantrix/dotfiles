alias dotfiles='c ~/.dotfiles'
alias reload='source ~/.zshrc'

alias ls='ls --color=tty -ha'

# App shortcuts
f() {
    : "${1:=.}"
    nohup nautilus -w $1 > /dev/null 2>&1 &!
}
alias fh='f ~'

c() {
    : "${1:=.}"
    code $1
    cd $1
}

u() {
    xdg-open "$(git remote get-url origin)" > /dev/null 2>&1
}

# GNOME3 lockscreen
alias lockscreen='xdg-screensaver lock'
alias bye='lockscreen'

# etc...
alias v='vim'
alias ccc='clear'

alias paclist="pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'"

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
    export KUBECONFIG=$(mktemp --tmpdir kubeconfig.XXXXXXXX)
    ls $KUBECONFIG
}

kcdel(){
    echo "Delete KUBECONFIG file"
    rm -f $KUBECONFIG
}

kcdel_tmp_all(){
    echo "Delete all KUBECONFIG.tmp files"
    rm -f /tmp/kubeconfig.*
    ls /tmp/kubeconfig.*
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

reload-icons(){
    sudo touch /usr/share/icons ~/.local/share/icons/
    sudo gtk-update-icon-cache -t -f /usr/share/icons/hicolor
    sudo gtk-update-icon-cache -t -f /usr/share/icons/Arc-X-D
}
reload-pulseaudio(){
    # reload pulseaudion config
    rm -r ~/.config/pulse; pulseaudio -k
}