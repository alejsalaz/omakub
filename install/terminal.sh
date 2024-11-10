#!/bin/bash
# Update and install essential terminal dependencies
sudo apt update -y
sudo apt upgrade -y
sudo apt install -y curl git unzip

# Run required terminal installers first
for installer in ~/.local/share/omakub/install/terminal/required/*.sh; do
  source "$installer"
done

# Run additional terminal installers
for installer in ~/.local/share/omakub/install/terminal/*.sh; do
  source "$installer"
done

echo "Terminal setup complete."
