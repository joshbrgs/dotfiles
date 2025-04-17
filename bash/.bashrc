#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# alias ls='ls --color=auto'
# alias grep='grep --color=auto'
[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases

PS1='[\u@\h \W]\$ '

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
. "$HOME/.deno/env"
. "$HOME/.cargo/env"
