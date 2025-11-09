#!/usr/bin/env bash
# ==========================================
# Script Name : main.sh
# Author      : <Pradyush Mohapatra> (<2241013332>)
# Description : Interactive menu for maintenance suite
# ==========================================

set -euo pipefail

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPTS_DIR="$BASE_DIR/scripts"
LOG_DIR="$BASE_DIR/logs"

mkdir -p "$LOG_DIR"

while true; do
  clear
  echo "=============================="
  echo " SYSTEM MAINTENANCE MENU"
  echo "=============================="
  echo "1. Backup Files"
  echo "2. System Update and Cleanup"
  echo "3. Log Monitoring"
  echo "4. Run All Tasks"
  echo "5. Exit"
  echo "=============================="
  read -rp "Enter your choice [1-5]: " choice

  case "$choice" in
    1)
      bash "$SCRIPTS_DIR/backup.sh"
      read -rp "Press Enter to continue..."
      ;;
    2)
      bash "$SCRIPTS_DIR/update-clean.sh"
      read -rp "Press Enter to continue..."
      ;;
    3)
      bash "$SCRIPTS_DIR/logwatch.sh"
      read -rp "Press Enter to continue..."
      ;;
    4)
      bash "$SCRIPTS_DIR/backup.sh"
      bash "$SCRIPTS_DIR/update-clean.sh"
      bash "$SCRIPTS_DIR/logwatch.sh"
      echo "✅ All maintenance tasks completed!"
      read -rp "Press Enter to continue..."
      ;;
    5)
      echo "Exiting... Goodbye!"
      exit 0
      ;;
    *)
      echo "Invalid choice. Try again."
      sleep 1
      ;;
  esac
done