#!/bin/bash

#===============================================================================
# install_baldurs_gate_2_desktop.sh
#
# Description:
#   This script installs an SSL compatibility fix for GOG's Baldur's Gate II:
#   Enhanced Edition and generates a .desktop launcher that uses a relative
#   LD_LIBRARY_PATH for compatibility with the older SSL v1.0 library.
#
# What it does:
#   - Checks to see if Baldurs Gate 2 is installed in the default GOG directory
#   - Downloads the required libssl compatibility files from xanathar's GitHub
#   - Extracts them into the game directory
#   - Creates a .desktop shortcut with a LD_LIBRARY_PATH on the user's desktop
#
# Requirements:
#   - curl
#   - unzip
#   - write access to ~/Desktop and the game folder
#
# Usage:
# If needed, set script to be executable:
#   chmod +x install_baldurs_gate_2_desktop.sh
# Then run script:
#   bash install_baldurs_gate_2_desktop.sh
#
# Author: Dustin CS Wagner
# Date: 2025-08-01
#===============================================================================

set -e  # Exit immediately if a command exits with a non-zero status

#----------------------------------------
# Define paths
#----------------------------------------
GAME_DIR="$HOME/GOG Games/Baldurs Gate II Enhanced Edition"
DESKTOP_DIR="$HOME/Desktop"
DESKTOP_FILE="$DESKTOP_DIR/baldurs_gate_ii.desktop"
ZIP_FILE="$GAME_DIR/main.zip"

#----------------------------------------
# Step 0: Ensure the game directory exists
#----------------------------------------
if [ ! -d "$GAME_DIR" ]; then
    echo "Error: Game directory not found at $GAME_DIR"
    exit 1
fi

#----------------------------------------
# Step 1: Download and extract the SSL fix files
#----------------------------------------
echo "Info: Downloading SSL fix files to $ZIP_FILE..."
curl -L -o "$ZIP_FILE" https://github.com/xanathar/baldursgate_ee_libssl_files/archive/refs/heads/master.zip

echo "Info: Extracting SSL fix ..."
# This will extract to a subfolder: baldursgate_ee_libssl_files-main
unzip -q "$ZIP_FILE" -d "$GAME_DIR"

#----------------------------------------
# Step 2: Create .desktop launcher on the user's desktop
#----------------------------------------
echo "Info: Creating desktop shortcut..."

cat > "$DESKTOP_FILE" <<EOF
[Desktop Entry]
Type=Application
Name=Baldur's Gate II: Enhanced Edition
GenericName=Baldur's Gate II: Enhanced Edition
Comment=Launches BG2:EE with SSL fix (libssl 1.0)
Icon=$GAME_DIR/support/icon.png
Exec=bash -c 'LD_LIBRARY_PATH="$GAME_DIR/baldursgate_ee_libssl_files-main/beamdog/x86_64/" "$GAME_DIR/start.sh"'
Categories=Game;
Path=$GAME_DIR/
# Uncomment the lines below if you want to keep the terminal open for debugging
#Terminal=true
#TerminalOptions=--noclose
EOF

chmod +x "$DESKTOP_FILE"

#----------------------------------------
# Step 3: Clean up the zip file
#----------------------------------------
echo "Info: Cleaning up zip file..."
rm -f "$ZIP_FILE"

#----------------------------------------
# Completion message
#----------------------------------------
echo "Installation complete!"
echo "Desktop shortcut created at: $DESKTOP_FILE"
echo "SSL fix files installed at: $GAME_DIR/baldursgate_ee_libssl_files-main/beamdog/x86_64/"
