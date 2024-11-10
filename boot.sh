#!/bin/bash
set -e

# ASCII art for the custom Omakub fork
ascii_art='
________                   __           ___.
\_____  \   _____ _____   |  | ____  _\_ |__
 /   |   \ /     \\__   \ |  |/ /   |  \ __ \
/    |    \  Y Y  \/ __ \|    <|   |  / \_\ \
\_______  /__|_|  (____  /__|_ \____/|___  /
        \/      \/     \/     \/         \/

Welcome to My Custom Omakub Fork!
'

# Define colors for Dracula theme
colors=(
	'\033[38;5;140m' # Purple
	'\033[38;5;61m'  # Dark Cyan
	'\033[38;5;92m'  # Light Purple
	'\033[38;5;97m'  # Pinkish Purple
	'\033[38;5;99m'  # Cyan
	'\033[38;5;135m' # Light Pink
)

# Display the ASCII art with colors
IFS=$'\n' read -rd '' -a lines <<<"$ascii_art"
for i in "${!lines[@]}"; do
	color_index=$((i % ${#colors[@]}))
	echo -e "${colors[color_index]}${lines[i]}"
done
echo -e '\033[0m' # Reset color at the end

echo "=> This is a customized Omakub installation, intended for Ubuntu-based systems."

# Ensure required tools are installed
sudo apt-get update >/dev/null
sudo apt-get install -y git >/dev/null

# Clone the repository and start the installation
echo "Cloning custom fork of Omakub..."
rm -rf ~/.local/share/omakub
git clone https://github.com/alejsalaz/omakub.git ~/.local/share/omakub >/dev/null

if [[ $OMAKUB_REF != "master" ]]; then
	cd ~/.local/share/omakub
	git fetch origin "${OMAKUB_REF:-stable}" && git checkout "${OMAKUB_REF:-stable}"
	cd -
fi

echo "Starting custom installation..."
source ~/.local/share/omakub/install.sh
