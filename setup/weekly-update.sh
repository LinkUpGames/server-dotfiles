#!/bin/bash

set -e

# Log File
LOGFILE="/var/log/weekly-update.log"

{
  echo "=== Weekly Update run: $(date) ==="

  # Refresh Repo Metadata
  dnf -y makecache

  # Update all packages
  dnf -y upgrade

  # Clean old packages
  dnf -y autoremove
  dnf clean all

  echo "=== Update Complete: $(date) ==="
} >>"$LOGFILE" 2>&1

# Rebot after update
/sbin/shutdown -r +1 "System reboot after weekly update"
