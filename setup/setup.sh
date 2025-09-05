#!/bin/bash

# Setup the service for updating
echo "=== Setting up server ==="
set -euo pipefail

# Symlink the files
ln -sf weekly-update.sh /usr/local/bin/weekly-update.sh
ln -sf weekly-update.service /etc/systemd/system/weekly-update.service
ln -sf weekly-update.timer /etc/systemd/system/weekly-update.timer

# Reload and set systemctl
systemctl daemon-reload
systemctl enable --now weekly-update.timer

systemctl list-timers | grep weekly-update
echo "=== Setting up server ==="
