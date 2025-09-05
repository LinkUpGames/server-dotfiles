#!/bin/bash

echo "=== Cron Setup ==="

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Make sure that cron is running
sudo systemctl enable --now crond

# Symlink
sudo ln -sf $DIR/../automation/dotfiles.sh /usr/local/bin/dotfiles.sh

# Add them to cron
(
  crontab -l 2>/dev/null | grep -Fv "/usr/local/bin/dotfiles.sh"
  echo "0 3 */2 * * /usr/local/bin/dotfiles.sh"
) | crontab -

echo "=== Cron Setup ==="
