# We're using lsd! The colors!
if [ -x "$(command -v lsd)" ]; then
	alias ls='lsd'
	alias ll='lsd -l'
	alias la='lsd -la'
fi

# tmux
alias retmux='tmux attach'
alias te='tmuxifier edit-session'
alias tm='tmuxifier'
alias t='~/.config/bin/t.sh'

# pacman
alias uu="sudo pacman -Syu"

# git
alias g="git"

# kubectl
alias k="kubectl"

# aws
alias asso="aws sso login --profile"
alias akc="aws eks update-kubeconfig"
# docker
alias up="docker compose up -d"
alias down="docker compose down"

alias dl="docker ps -a"
alias dvl="docker volume ls"
alias dnl="docker network ls"
alias dil="docker image ls"
alias d="docker"

# [[ -f ~/.ssh_aliases ]] && source ~/.ssh_aliases
