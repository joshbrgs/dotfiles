#!/bin/sh
ZOXIDE_RES=$(zoxide query $1)

if [ -z "$ZOXIDE_RES" ]; then
  exit 0
fi

FOLDER=$(basename $ZOXIDE_RES)

SESSION=$(tmux list-sessions | grep $FOLDER | awk '{print $1}')
SESSION=${SESSION//:/}

if [ -z "$TMUX" ]; then
  echo "is not tmux"
  if [ -z "$SESSION" ]; then
    echo "session does not exist"
    cd $ZOXIDE_RES
    tmux new-session -s $FOLDER
  else
    echo "session exists"
    tmux attach -t $SESSION
  fi
 else
  echo "is tmux"
  if [ -z "$SESSION" ]; then
    echo "session does not exist"
    cd $ZOXIDE_RES
    tmux new-session -d -s $FOLDER
    tmux switch-client -t $FOLDER
  else
    echo "session exists"
    tmux switch-client -t $SESSION
  fi
fi
