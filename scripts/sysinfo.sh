#!/usr/bin/env bash
# ==========================================
# Script Name : sysinfo.sh
# Author      : <Pradyush Mohapatra> (<2241013332>)
# Description : Displays system and hardware information
# ==========================================

set -euo pipefail

LOG_DIR="$(dirname "$0")/../logs"
mkdir -p "$LOG_DIR"

{
  echo "[$(date)] System Information"
  echo "------------------------------"
  echo "Hostname: $(hostname)"
  echo "Operating System: $(lsb_release -d 2>/dev/null | cut -f2- || uname -s)"
  echo "Kernel Version: $(uname -r)"
  echo "Architecture: $(uname -m)"
  echo "CPU Info:"
  lscpu | grep -E 'Model name|CPU\(s\):|Thread|Socket|MHz'
  echo
  echo "Memory Info:"
  free -h
  echo
  echo "Uptime: $(uptime -p)"
} >> "$LOG_DIR/sysinfo.log" 2>&1

echo "✅ System Information:"
hostnamectl | grep -E 'Operating System|Kernel|Architecture|Hardware' || true
echo "Logs saved to $LOG_DIR/sysinfo.log"
