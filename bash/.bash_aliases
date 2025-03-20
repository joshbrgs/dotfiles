alias help='bat $HOME/.bash_aliases'
# We're using lsd! The colors!
if [ -x "$(command -v lsd)" ]; then
  alias ls='lsd'
  alias ll='lsd -l'
  alias la='lsd -la'
fi

#------------------------------------------------------
# Misc Functions
#------------------------------------------------------

# Find out what's running on a given port
function whatsonport() {
    lsof -i tcp:$1
}

function killport() { lsof -i TCP:$1 | grep LISTEN | awk '{print $2}' | xargs kill -9 }

# Enable nvm in the current shell.
function snvm() {
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

# For windows, when wsl acts up on yank and paste
function yanky() {
  echo ':WSLInterop:M::MZ::/init:PF' | sudo tee /usr/lib/binfmt.d/WSLInterop.conf
  sudo systemctl restart systemd-binfmt
}

function uu() {
  brew upgrade && brew update
  sudo pacman -Syu
  yay -Syyu
}
# ---------------------------------------------

# tmux
alias remux='tmux attach'
# alias te='tmuxifier edit-session'
# alias tm='tmuxifier'

# terraform
alias tf='terraform'

# git
alias g="git"
function gaa() {
    git add . && git commit -m "$1" && git push
}

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
list_profiles() {
    local file="${1:-$HOME/.aws/config}"  # Default to ~/.aws/config if no file is provided

    if [[ ! -f "$file" ]]; then
        echo "Error: File '$file' not found."
        return 1
    fi

    grep '^\[profile ' "$file" | sed -E 's/^\[profile ([^]]+)].*/\1/' | nl
}

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
alias dd="lazydocker"

# [[ -f ~/.ssh_aliases ]] && source ~/.ssh_aliases
alias c="cd"
gt() {
  git tag -a "$1" -m "$2"
  git push --tags
}
alias x="exit"

# Neovim
alias n="nv"
alias nv='nvim'

# vscode
alias c='code .'

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

# Rust
alias cr='cargo'

# Golang
alias gmt='go mod tidy'
alias gr='go run'
alias gta='go test ./...'
