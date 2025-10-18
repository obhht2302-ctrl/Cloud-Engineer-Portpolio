#!/usr/bin/env bash
# status_report.sh — Week1 Mini Project
# Collects system status into a timestamped text report.
set -euo pipefail
IFS=$'\n\t'

REPORT_DIR="${REPORT_DIR:-./docs/reports}"
REPORT_PREFIX="${REPORT_PREFIX:-report}"
KEEP_DAYS="${KEEP_DAYS:-14}"
TOP_N="${TOP_N:-5}"
SERVICE_CHECKS="${SERVICE_CHECKS:-nginx}"

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"
REPORT_DIR_ABS="${REPO_ROOT}/docs/reports"

mkdir -p "${REPORT_DIR_ABS}"

timestamp="$(date +"%Y-%m-%d_%H-%M-%S")"
date_human="$(date -R)"
host="$(hostname)"
local_ips="$(hostname -I 2>/dev/null || true)"
public_ip=""
if command -v curl >/dev/null 2>&1; then
  public_ip="$(curl -fsS --max-time 2 ifconfig.me || true)"
fi

out="${REPORT_DIR_ABS}/${REPORT_PREFIX}_${timestamp}.txt"

section() { 
  printf "\n===== %s =====\n" "$1" >> "$out"
}

{
  echo "System Weekly Status Report"
  echo "Generated: ${date_human}"
  echo "Host: ${host}"
  echo "Local IP(s): ${local_ips:-N/A}"
  echo "Public IP: ${public_ip:-N/A}"
} > "$out"

section "Uptime & Load"
uptime >> "$out" || true

section "Disk Usage (df -h)"
df -h >> "$out" || true

section "Memory (free -h)"
free -h >> "$out" || true

section "Service Status (systemctl is-active)"
for svc in ${SERVICE_CHECKS}; do
  if command -v systemctl >/dev/null 2>&1; then
    state="$(systemctl is-active "$svc" 2>/dev/null || true)"
    echo "${svc}: ${state:-unknown}" >> "$out"
  else
    echo "systemctl not available" >> "$out"
  fi
done

section "Listening TCP Ports (ss -lntp | head)"
if command -v ss >/dev/null 2>&1; then
  ss -lntp | head -n 20 >> "$out" || true
else
  echo "ss not available" >> "$out"
fi

section "Top ${TOP_N} Processes by CPU"
ps -eo pid,ppid,comm,%cpu,%mem --sort=-%cpu | awk -v n="${TOP_N}" 'NR==1 || NR<=n+1' >> "$out" || true

section "Top ${TOP_N} Processes by MEM"
ps -eo pid,ppid,comm,%cpu,%mem --sort=-%mem | awk -v n="${TOP_N}" 'NR==1 || NR<=n+1' >> "$out" || true

section "Recent Service Logs (journalctl -u <svc> -n 50)"
if command -v journalctl >/dev/null 2>&1; then
  for svc in ${SERVICE_CHECKS}; do
    echo "--- ${svc} ---" >> "$out"
    journalctl -u "$svc" -n 50 --no-pager 2>/dev/null >> "$out" || echo "(no logs)" >> "$out"
  done
else
  echo "journalctl not available" >> "$out"
fi

find "${REPORT_DIR_ABS}" -type f -name "${REPORT_PREFIX}_*.txt" -mtime +"${KEEP_DAYS}" -print -delete 2>/dev/null || true

echo -e "\nReport saved to: ${out}"
