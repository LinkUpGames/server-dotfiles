#!/bin/zsh

LOGFILE="$HOME/logs/dotfiles.log"

# Update own dotfiles if any
{
  echo "Updating..."

  cd $HOME/dotfiles
  git pull origin main >/dev/null 2>&1

  cd $HOME/server-dotfiles
  git pull origin main >/dev/null 2>&1

  source $HOME/profile.zsh
  source $HOME/.zshrc

  nvim --headless "+Lazy! sync" +qa

  echo "Update done!"
} >"$LOGFILE" 2>&1
