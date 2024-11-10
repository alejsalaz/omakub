#!/bin/bash

# Define color variables for better readability
RED=$(tput setaf 1)
RESET=$(tput sgr0)

# Check if /etc/os-release file exists
if [ ! -f /etc/os-release ]; then
    echo "${RED}Error: Unable to determine OS. /etc/os-release file not found.${RESET}"
    echo "Installation stopped."
    exit 1
fi

# Source OS information
. /etc/os-release

# Check if the OS is Ubuntu-based
if [[ "$ID" != "ubuntu" && "$ID_LIKE" != *"ubuntu"* ]]; then
    echo "${RED}Error: OS requirement not met${RESET}"
    echo "This installer only supports Ubuntu-based distributions."
    echo "You are currently running: $ID $VERSION_ID"
    echo "Installation stopped."
    exit 1
fi

# Check for minimum Ubuntu version (24.04 or higher for Ubuntu-based)
if [[ "$ID" == "ubuntu" && $(echo "$VERSION_ID >= 24.04" | bc) != 1 ]]; then
    echo "${RED}Warning: Ubuntu version 24.04 or higher is recommended.${RESET}"
elif [[ "$ID" == "linuxmint" && $(echo "$VERSION_ID >= 21.2" | bc) != 1 ]]; then
    echo "${RED}Warning: Linux Mint version 21.2 or higher is recommended.${RESET}"
fi

echo "OS verification complete. Proceeding with installation..."
