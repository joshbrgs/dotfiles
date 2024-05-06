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
export PATH="$PATH:$GOPATH/bin"
export PATH="$HOME/.cargo/bin:$PATH"
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export ANDROID_HOME=/Users/josh/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
# Added by Amplify CLI binary installer
export PATH="$HOME/.amplify/bin:$PATH"
# tmuxifier
export PATH="$HOME/.tmuxifier/bin:$PATH"
# ~/.tmux/plugins
export PATH=$HOME/.tmux/plugins/t-smart-tmux-session-manager/bin:$PATH
# ~/.config/tmux/plugins
export PATH=$HOME/.config/tmux/plugins/t-smart-tmux-session-manager/bin:$PATH
export PATH=$HOME/.pulumi/bin:$PATH
export PATH=$PATH:$(go env GOPATH)/bin
#------------------------------------------------------
# Functions
#------------------------------------------------------

# Find out what's running on a given port
whatsonport() {
    lsof -i tcp:$1
}

killport() { lsof -i TCP:$1 | grep LISTEN | awk '{print $2}' | xargs kill -9 }
# Enable nvm in the current shell.
# Loading nvm by default is slow, and most of the time we don't need it.

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/josh/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/josh/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/josh/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/josh/google-cloud-sdk/completion.zsh.inc'; fi

alias nv='nvim'
[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(tmuxifier init -)"

eval "$(starship init zsh)"

eval "$(fzf --zsh)"

eval "$(zoxide init --cmd cd zsh)"

alias ls="eza --color=always --icons=always --long --git --no-filesize --no-time --no-user --no-permissions"

eval $(thefuck --alias)
# You can use whatever you want as an alias, like for Mondays:
eval $(thefuck --alias FUCK)

# add Pulumi to the PATH
export PATH=$PATH:/home/jburgess/.pulumi/bin
