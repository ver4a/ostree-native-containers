#!/usr/bin/bash
set -euo pipefail

# Add rpmfusion repositories
dnf5 -y install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Install ffmpeg (removing all the -free replacements is required)
dnf5 -y install --allowerasing ffmpeg

PKGS_CODECS="intel-media-driver openh264 mozilla-openh264 ffmpeg"
PKGS_UTILS="igt-gpu-tools"
PKGS_GENERAL="vim bat btop pv restic zstd nmap-ncat yt-dlp"
# Set vim as default editor
PKGS_DEFAULT_EDITOR="vim-default-editor"
# Load the ntsync kernel module on boot
PKGS_NTSYNC="ntsync-autoload"

# Add packages
dnf5 -y install --allowerasing ${PKGS_CODECS} ${PKGS_UTILS} ${PKGS_GENERAL} ${PKGS_DEFAULT_EDITOR} ${PKGS_NTSYNC}

# Remove default color prompt (is replaced with a custom one)
dnf5 -y remove bash-color-prompt

# Apply configuration
# fix-up kconfig path
sed -i "/SCX_FLAGS=/ s/$/ --kconfig \/usr\/lib\/modules\/$(rpm -qa kernel | sed 's/kernel-//g')\/config/" /etc/default/scx

# Apply hardened firewall configuration
firewall-offline-cmd --set-default-zone public
firewall-offline-cmd --remove-service ssh

# Restrict permissions on quadlet directory
chmod 700 /etc/containers/systemd

# https://github.com/ostreedev/ostree-rs-ext/issues/159
ostree container commit
