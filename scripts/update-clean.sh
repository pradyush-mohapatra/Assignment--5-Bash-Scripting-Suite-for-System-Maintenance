#!/usr/bin/env bash
# ==========================================
# Script Name : update-clean.sh
# Author      : <Pradyush Mohapatra> (<2241013332>)
# Description : Updates and cleans the system
# ==========================================

set -euo pipefail

LOG_DIR="$(dirname "$0")/../logs"
mkdir -p "$LOG_DIR"

{
  echo "[$(date)] Starting system update..."
  sudo apt update -y
  sudo apt upgrade -y
  sudo apt autoremove -y
  sudo apt autoclean -y
  echo "[$(date)] System update and cleanup completed."
} >> "$LOG_DIR/update.log" 2>&1

echo "✅ System updated and cleaned successfully!"
