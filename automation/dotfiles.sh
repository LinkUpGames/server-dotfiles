#!/bin/zsh

LOGFILE="$HOME/logs/dotfiles.log"

# Update own dotfiles if any
{
  echo "Updating..."

  cd $HOME/dotfiles
  git pull origin main >/dev/null 2>&1

  cd $HOME/server-dotfiles >/dev/null 2>&1
  git pull origin main >/dev/null 2>&1

  source $HOME/profile.zsh
  source $HOME/.zshrc

  nvim --headless "+Lazy! sync" +qa >/dev/null 2>&1

  echo "Update done!"
} >"$LOGFILE" 2>&1
