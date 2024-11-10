#!/bin/bash

# Ensure Flatpak is installed
if ! command -v flatpak &>/dev/null; then
  sudo apt update && sudo apt install -y flatpak
  sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
fi

# Install MarkText via Flatpak
flatpak install -y flathub com.github.marktext.marktext

echo "MarkText installed successfully via Flatpak. You can find it in your application menu."
