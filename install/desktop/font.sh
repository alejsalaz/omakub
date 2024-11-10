#!/bin/bash

# Function to install Meslo Nerd Font using the Nerd Fonts install script
install_meslo_font() {
	# Clone the Nerd Fonts repository (shallow clone to save space)
	if [ ! -d "/tmp/nerd-fonts" ]; then
		git clone --depth 1 https://github.com/ryanoasis/nerd-fonts.git /tmp/nerd-fonts
	fi

	# Run the install script specifically for Meslo
	/tmp/nerd-fonts/install.sh "Meslo"

	# Update font cache
	fc-cache -fv
}

# Install Meslo font
install_meslo_font
echo "Meslo Nerd Font installation complete!"
