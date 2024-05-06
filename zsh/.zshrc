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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

alias nv='nvim'
[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases

if [[ $(uname) == "Linux" ]]; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(tmuxifier init -)"

eval "$(starship init zsh)"

eval "$(fzf --zsh)"

# -- Use fd instead of fzf --

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:#cdd6f4,fg+:#b4befe,bg:#11111b,bg+:#181825
  --color=hl:#74c7ec,hl+:#89dceb,info:#fab387,marker:#fab387
  --color=prompt:#f38ba8,spinner:#cba6f7,pointer:#f2cdcd,header:#cba6f7
  --color=border:#6c7086,label:#f5e0dc,query:#b4befe
  --border="sharp" --border-label="FZF IT" --border-label-pos="0" --preview-window="border-double"
  --padding="1" --prompt="🦐" --marker="🦄" --pointer="👻"
  --separator="─" --scrollbar="│" --info="right"'

eval "$(zoxide init --cmd cd zsh)"

alias ls="eza --color=always --icons=always --long --git --no-filesize --no-time --no-user --no-permissions"

eval $(thefuck --alias)
# You can use whatever you want as an alias, like for Mondays:
eval $(thefuck --alias FUCK)

source $HOME/fzf-git.sh

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

gco() {
  _fzf_git_each_ref --no-multi | xargs git checkout
}

gb() {
  _fzf_git_branches --no-multi
}

gtags() {
  _fzf_git_tags --no-multi
}

gf() {
  _fzf_git_files --no-multi
}

source $HOME/fzf_git_files.sh
source $HOME/fzf_git_branch.sh
source $HOME/fzf_git_commits.sh
