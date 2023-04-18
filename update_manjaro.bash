#!/bin/bash

# Make sure only root can run the script
if [ "$(id -u)" != "0" ]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi

# Update pacman repositories and upgrade packages
echo "Updating system packages..."
pacman -Syu --noconfirm

# Install pamac, an AUR helper, if not already installed
if ! command -v pamac &> /dev/null; then
    echo "Installing pamac..."
    pacman -S --noconfirm pamac
fi

# Update AUR packages
echo "Updating AUR packages..."
pamac upgrade -a --no-confirm

# Install missing language packs
echo "Installing missing language packs..."
pacman -S --noconfirm $(pacman -Slq | grep language)

# Find the latest stable kernel version and install/update it
LATEST_KERNEL=$(pacman -Slq | grep '^linux[0-9]*$' | tail -n 1)
echo "Installing/updating to the latest non-RC kernel: $LATEST_KERNEL..."
pacman -S --noconfirm $LATEST_KERNEL

# Remove unused and old packages and dependencies
echo "Cleaning up old and unused packages..."
paccache -r
pacman -Rns $(pacman -Qdtq)

# Optimize Pacman database
echo "Optimizing Pacman database..."
pacman-optimize

echo "All tasks completed successfully!"
