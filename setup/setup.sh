#!/bin/bash

# Setup the service for updating
echo "=== Setting up server ==="
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Copy the files
# ln -srf "$DIR/../automation/weekly-update.sh" /usr/local/bin/weekly-update.sh
cp "$DIR/../automation/weekly-update.sh" /usr/local/bin/weekly-update.sh
cp weekly-update.service /etc/systemd/system/weekly-update.service
cp weekly-update.timer /etc/systemd/system/weekly-update.timer

# Reload and set systemctl
systemctl daemon-reload

# Start the service
systemctl start weekly-update.timer
systemctl enable --now weekly-update.timer

systemctl list-timers | grep weekly-update
echo "=== Setting up server ==="

# Setup cron
echo "=== Setting up Cron ==="
./$DIR/cron.sh
echo "=== Setting up Cron ==="
