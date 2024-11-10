#!/bin/bash
# Exit immediately if a command exits with a non-zero status
set -e

# Check the distribution name and version; abort if incompatible
source ~/.local/share/omakub/install/check-version.sh

echo "Starting installation process..."

# Ensure the computer doesn't go to sleep or lock during the installation
# Mask sleep, suspend, hibernate, and hybrid-sleep targets
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target

# Run first-run choices
source ~/.local/share/omakub/install/first-run-choices.sh

# Run terminal setup and required installers
source ~/.local/share/omakub/install/terminal.sh

# Check if a desktop environment is running
if [ -n "$XDG_CURRENT_DESKTOP" ]; then
  echo "Desktop environment detected. Installing desktop tools..."
  for installer in ~/.local/share/omakub/install/desktop/*.sh; do
    source "$installer"
  done
else
  echo "No desktop environment detected. Skipping desktop tools."
fi

# Unmask sleep settings to revert to normal
sudo systemctl unmask sleep.target suspend.target hibernate.target hybrid-sleep.target
# Clean up
sudo apt autoremove -y

echo "Installation complete."

# Prompt to reboot for all settings to take effect
if gum confirm "Ready to reboot for all settings to take effect?"; then
  sudo reboot
else
  echo "Please reboot manually for changes to take full effect."
fi
