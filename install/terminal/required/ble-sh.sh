#!/bin/bash

# Ensure gawk is installed
sudo apt-get update
sudo apt-get install -y gawk

# Clone and install Ble.sh in /tmp and clean up afterward
cd /tmp
git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
make -C ble.sh install PREFIX=~/.local
rm -rf ble.sh # Remove the cloned directory after installation

# Add Ble.sh to Bash startup
echo 'source ~/.local/share/blesh/ble.sh' >>~/.bashrc

# Configure Ble.sh with fzf
echo '# Ble.sh configuration with fzf' >>~/.bashrc
echo 'source /etc/profile.d/bash_completion.sh' >>~/.bashrc
echo 'ble-import -d integration/fzf-completion' >>~/.bashrc
echo 'ble-import -d integration/fzf-key-bindings' >>~/.bashrc

# Return to original directory
cd -
