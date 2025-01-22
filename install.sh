#!/bin/bash

# Detect OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    if ! command -v brew &> /dev/null; then
        echo "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    brew install webp
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    if command -v apt-get &> /dev/null; then
        # Debian/Ubuntu
        sudo apt-get update
        sudo apt-get install -y webp
    elif command -v yum &> /dev/null; then
        # RedHat/CentOS
        sudo yum install -y libwebp-tools
    fi
fi

# Download and install the conversion script
curl -O https://raw.githubusercontent.com/curenorway/webp-converter/main/webp.sh
chmod +x webp.sh
sudo mv webp.sh /usr/local/bin/webp

echo "Installation complete! You can now use the 'webp' command."