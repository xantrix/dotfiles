# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# You may need to manually set your language environment
export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_PAPER="en_US.UTF-8"
export LC_NAME="en_US.UTF-8"
export LC_ADDRESS="en_US.UTF-8"
export LC_TELEPHONE="en_US.UTF-8"
export LC_MEASUREMENT="en_US.UTF-8"
export LC_IDENTIFICATION="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export TERM=xterm-256color

export EDITOR=vim
export SUDO_EDITOR=vi

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
POWERLEVEL9K_MODE=nerdfont-complete
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom fkolder than $ZSH/custom?
ZSH_CUSTOM=$HOME/.config/zsh

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins
plugins=(
  archlinux
  git
  colored-man-pages
  colorize
  common-aliases
  dirhistory
  nmap
  docker
  kubectl
  minikube
  encode64
  golang
  jsontools
  sudo
  kubetail
)
# disabled: per-directory-history
# https://www.ashryan.io/finding-out-where-zsh-alias-and-settings-are-defined/
# zsh -ixc : 2>&1 | grep "G="
# ~/.oh-my-zsh/plugins/common-aliases/common-aliases.plugin.zsh:26> alias -g 'G=| grep'


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"
export CDPATH=.:$HOME:$HOME/code
export PATH=$PATH:$HOME/bin:$HOME/.local/bin

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
# do not set KUBECONFIG explicitly 
#export KUBECONFIG=${HOME}/.kube/config:${HOME}/.kube/kind-config-kind
#export KUBECONFIG=${HOME}/.kube/config
# install krew https://krew.sigs.k8s.io/docs/user-guide/setup/install/
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

# dynamic kubeconfig per virtual terminal to avoid mutating global state
if [ -z "$KUBECONFIG" ]; then
  export KUBECONFIG=$(mktemp --tmpdir kubeconfig.XXXXXXXX)
  #remove the temp kubeconfig file when at shell exit
  trap "rm -f $KUBECONFIG" EXIT
fi
# add kind config file
# export KUBECONFIG=$KUBECONFIG:${HOME}/.kube/kind-config-kind

# The agent will quit after one hour, unless the LPASS_AGENT_TIMEOUT seconds in which to quit, or 0 to never quit
export LPASS_AGENT_TIMEOUT=0

# Ruby https://wiki.archlinux.org/title/ruby#Installing_Ruby
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"

# Nodejs https://wiki.archlinux.org/title/Node.js#Allow_user-wide_installations
export npm_config_prefix="$HOME/.local"

# Hardware Video Acceleration
# https://wiki.archlinux.org/title/Hardware_video_acceleration Intel
export LIBVA_DRIVER_NAME="iHD"
export LIBVA_DRIVERS_PATH="/usr/lib/dri"
export VDPAU_DRIVER="va_gl"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Powerlevel9k config

POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_DELIMITER=""
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

POWERLEVEL9K_TIME_ICON=""
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M:%S %d.%m.%y}"

POWERLEVEL9K_VCS_GIT_ICON='\uf1d3'
POWERLEVEL9K_VCS_GIT_GITHUB_ICON='\uf09b'

# Plus icon
POWERLEVEL9K_VCS_STAGED_ICON='\uf44d'

# Asterisk icon
POWERLEVEL9K_VCS_UNTRACKED_ICON='*U'
POWERLEVEL9K_VCS_UNSTAGED_ICON='\uf881'

# Up & down icons
POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\uf176'
POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\uf175'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
  status root_indicator background_jobs kubecontext terraform
  ) # default: status root_indicator background_jobs history time
source $ZSH/oh-my-zsh.sh

[[ ! -f ~/private-aliases.zsh ]] || source ~/private-aliases.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/xan/google-cloud-sdk/path.zsh.inc' ]; then . '/home/xan/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/xan/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/xan/google-cloud-sdk/completion.zsh.inc'; fi
