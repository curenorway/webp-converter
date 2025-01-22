#!/bin/bash

# Check if running on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    echo "This script is for macOS only!"
    exit 1
fi

# Check and install Xcode Command Line Tools if needed
if ! xcode-select -p &>/dev/null; then
    echo "Installing Xcode Command Line Tools..."
    xcode-select --install
    echo "Please wait for Xcode Command Line Tools installation to complete and press enter..."
    read -r
fi

# Install Homebrew if needed
if ! command -v brew &>/dev/null; then
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install webp tools
brew install webp

# Download and install the conversion script
curl -O https://raw.githubusercontent.com/curenorway/webp-converter/main/webp.sh
chmod +x webp.sh
sudo mv webp.sh /usr/local/bin/webp

echo "Installation complete! You can now use the 'webp' command."
