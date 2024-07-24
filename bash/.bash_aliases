# We're using lsd! The colors!
if [ -x "$(command -v lsd)" ]; then
  alias ls='lsd'
  alias ll='lsd -l'
  alias la='lsd -la'
fi

# tmux
alias remux='tmux attach'
alias te='tmuxifier edit-session'
alias tm='tmuxifier'

# terraform
alias tf='terraform'

# pacman
alias uu="sudo pacman -Syu"

# homebrew
alias hu="brew update && brew upgrade"

# git
alias g="git"

# kubectl
alias k="kubectl"
alias ka="kubectl apply -f"
alias kg="kubectl get"
alias kd="kubectl describe"
alias kdel="kubectl delete"
alias kl="kubectl logs"
alias kgpo="kubectl get pod"
alias kgd="kubectl get deployments"
alias kc="kubectx"
alias kns="kubens"
alias kl="kubectl logs -f"
alias ke="kubectl exec -it"
alias kcns='kubectl config set-context --current --namespace'

# aws
alias asso="aws sso login --profile"
alias akc="aws eks update-kubeconfig"
# docker
alias up="docker compose up -d"
alias down="docker compose down"

alias dps="docker ps"
alias dpa="docker ps -a"
alias dl="docker ps -l -q"
alias dx="docker exec -it"
alias dvl="docker volume ls"
alias dnl="docker network ls"
alias dil="docker image ls"
alias d="docker"

# [[ -f ~/.ssh_aliases ]] && source ~/.ssh_aliases
alias n="nv"
alias c="cd"
gt() {
  git tag -a "$1" -m "$2"
  git push --tags
}
alias gg="g aa && g cm "Updates CI" && g ps && .. && ls"

# Neovim
alias nv='nvim'

# Eza, Zoxide, and bat shit
alias ls="eza --color=always --icons=always --long --git --no-filesize --no-time --no-user --no-permissions"
alias cl='clear'
alias cat='bat -pp'

# Dirs
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."

# Obsidian
alias oo='cd $HOME/projects/Obsidian/'
alias or='nvim $HOME/projects/Obsidian/inbox/*.md'
alias ou='cd $HOME/bin/notion-sync && node batchUpload.js --lastmod-days-window 5'
