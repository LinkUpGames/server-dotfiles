#!/bin/zsh

LOGFILE="/var/log/dotfiles.log"

# Update own dotfiles if any
{

  cd $HOME/dotfiles
  git pull origin main

  cd $HOME/server-dotfiles >/dev/null 2>&1
  git pull origin main >/dev/null 2>&1

  source $HOME/profile.zsh
  source $HOME/.zshrc

  nvim --headless "+Lazy! sync" +qa >/dev/null 2>&1
} >>"$LOGFILE" 2>&1
