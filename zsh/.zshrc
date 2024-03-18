# use 256 color terminal
export TERM=xterm-256color

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# use vim as standard editor
export VISUAL=nvim
export EDITOR="$VISUAL"

#------------------------------------------------------
# PATHs
#------------------------------------------------------
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"
export PATH="$HOME/.cargo/bin:$PATH"
export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

#------------------------------------------------------
# Functions
#------------------------------------------------------

# Find out what's running on a given port
whatsonport() {
    lsof -i tcp:$1
}

# Enable nvm in the current shell.
# Loading nvm by default is slow, and most of the time we don't need it.
loadnvm() {
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

alias nv='nvim'
[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases

[[ -f ~/.zsh-autosuggestionis ]] && source ~/.zsh-autosuggestionis

eval "$(starship init zsh)"
