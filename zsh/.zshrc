# use 256 color terminal
export TERM=xterm-256color

# use vim as standard editor
export VISUAL=nvim
export EDITOR="$VISUAL"

{ eval `ssh-agent`; ssh-add ~/.ssh/bitbucket; ssh-add ~/.ssh/github } &>/dev/null


#------------------------------------------------------
# PATHs
#------------------------------------------------------
export PATH="$HOME/.local/bin:$PATH"
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PATH="$PATH:$GOPATH/bin"
export PATH="$HOME/.cargo/bin:$PATH"
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
# Added by Amplify CLI binary installer
export PATH="$HOME/.amplify/bin:$PATH"
# tmuxifier
# export PATH="$HOME/.tmuxifier/bin:$PATH"
# export PATH=$HOME/.tmux/plugins/t-smart-tmux-session-manager/bin:$PATH
# ~/.config/tmux/plugins
# export PATH=$HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin:$PATH
export PATH=$HOME/.pulumi/bin:$PATH
export PATH=$PATH:$(go env GOPATH)/bin
export PATH="$HOME/bin:$PATH"
export PATH=$HOME/development/flutter/bin:$PATH
export PATH=$HOME/.gem/bin:$PATH
export PATH="$PATH":"$HOME/.pub-cache/bin"
export STARSHIP_CONFIG=$HOME/.config/rose-starship.toml
#------------------------------------------------------
# Functions
#------------------------------------------------------

# Find out what's running on a given port
whatsonport() {
    lsof -i tcp:$1
}

killport() { lsof -i TCP:$1 | grep LISTEN | awk '{print $2}' | xargs kill -9 }

# Enable nvm in the current shell.
snvm() {
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

# For windows, when wsl acts up on yank and paste
yanky() {
  echo ':WSLInterop:M::MZ::/init:PF' | sudo tee /usr/lib/binfmt.d/WSLInterop.conf
  sudo systemctl restart systemd-binfmt
}

update() {
  brew upgrade && brew update
  sudo pacman -Syu
  yay -Syyu
}

y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases

if [[ $(uname) == "Linux" ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

autoload -Uz compinit
compinit

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source ~/bin/obsidian_functions.sh

source ~/bin/kbuilder-autocomp.sh 

source $HOME/.rvm/scripts/rvm

source $HOME/_deno

# eval "$(tmuxifier init -)"

eval "$(starship init zsh)"

eval "$(fzf --zsh)"

eval "$(zoxide init --cmd cd zsh)"

eval $(thefuck --alias)

# You can use whatever the fuck you want as an alias, like for Mondays:
eval $(thefuck --alias FUCK)

[[ -f ~/.fzfrc ]] && source ~/.fzfrc

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
# . "$HOME/.deno/env"
