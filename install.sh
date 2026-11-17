#!/data/data/com.termux/files/usr/bin/bash
# 小菜花 Harness（dsh）在 Termux 的安裝腳本 — 2026-11-17 實測可跑
set -e
echo "deb https://packages.termux.dev/apt/termux-main stable main" > "$PREFIX/etc/apt/sources.list"
apt update
apt full-upgrade -y -o Dpkg::Options::=--force-confdef -o Dpkg::Options::=--force-confold
pkg install -y nodejs-lts git
node -v
npm install -g @deepseek-ai/dsh
dsh --version
echo HARNESS_READY
